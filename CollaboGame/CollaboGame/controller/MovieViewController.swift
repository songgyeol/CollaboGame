//
//  MovieViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

class MovieViewController: UIViewController {
    var movieView = UIView()
    var mainLabel = CustomLabel(title: "영화명대사", size: 30)
    let movieImageView = UIImageView()
    var answerButton = CustomButton(title: "시작하기")
    var qAndAText = ""
    var unSelected = ""
    let qaTitle = ["문제", "정답"]
    
    var movieTitle = ""
    var year = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "그 대사 뭐니"
        
        let random = MovieLine.shared.yearMovie.randomElement()
        movieTitle = random?.key ?? "스물"
        year = random?.value ?? 2022
        
        APIManager.shared.requestMovie(word: movieTitle, year: year) { response in
            switch response {
            case .success(let data):
                self.loadImage(imageUrl: data.items[0].image)
                print(data.items)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        setUI()
    }
    
    private func loadImage(imageUrl: String) {
        let urlString = imageUrl
        guard let url = URL(string: urlString) else { return }
        
        // 오래걸리는 작업을 동시성 처리 (다른 쓰레드에서 일시킴)
        DispatchQueue.global().async {
            // URL을 가지고 데이터를 만드는 메서드 (오래걸리는데 동기적인 실행)
            // (일반적으로 이미지를 가져올때 많이 사용)
            guard let data = try? Data(contentsOf: url) else { return }
            // 오래걸리는 작업이 일어나고 있는 동안에 url이 바뀔 가능성 제거 ⭐️⭐️⭐️
            guard urlString == url.absoluteString else { return }
            
            // 작업의 결과물을 이미로 표시 (메인큐)
            DispatchQueue.main.async {
                self.movieImageView.image = UIImage(data: data)
            }
        }
    }
}

extension MovieViewController {
    @objc
    func answerButton(_ sender: UIButton) {
        
        if sender.currentTitle == "시작하기" {
            answerButton.setTitle("정답확인", for: .normal)
            answerButton.setTitleColor(.yellow, for: .normal)
            qAndAText = MovieLine.shared.movieQ["\(qaTitle[0])"]?.randomElement() ?? ""
            mainLabel.text = qAndAText
            movieView.isHidden = true
        } else if sender.currentTitle == "정답확인" {
            mainLabel.textColor = .yellow
            answerButton.setTitle("다음문제", for: .normal)
            
            let selected = MovieLine.shared.movieA[qAndAText] ?? ""
            unSelected = selected
            mainLabel.text = "\(unSelected)"
            
            answerButton.setTitleColor(CustomColor.btnTextColor, for: .normal)
        } else if sender.currentTitle == "다음문제" {
            mainLabel.textColor = .white
            answerButton.setTitle("정답확인", for: .normal)
            qAndAText = MovieLine.shared.movieQ["\(qaTitle[0])"]?.randomElement() ?? ""
            answerButton.setTitleColor(.yellow, for: .normal)
            mainLabel.text = qAndAText
            movieView.isHidden = true
        }
    }
}

extension MovieViewController {
    func setUI() {
        setBasic()
        setLayout()
    }
    
    func setBasic() {
        [mainLabel,answerButton, movieImageView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        answerButton.addTarget(self, action: #selector(answerButton(_:)), for: .touchUpInside)
        mainLabel.numberOfLines = 0
    }
    
    //MARK: - SetLayout
    func setLayout() {
        
        NSLayoutConstraint.activate([
            movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImageView.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: 30),
            movieImageView.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor, constant: 50),
            movieImageView.trailingAnchor.constraint(equalTo: mainLabel.trailingAnchor, constant: -50),
            movieImageView.bottomAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: -30),
            
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            mainLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            mainLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            mainLabel.heightAnchor.constraint(equalToConstant: 300),
            
            answerButton.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 50),
            answerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerButton.heightAnchor.constraint(equalToConstant: 70),
            answerButton.widthAnchor.constraint(equalToConstant: 270),
        ])
    }
    
}

