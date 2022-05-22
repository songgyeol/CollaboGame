//
//  PersonViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

class PersonViewController: UIViewController {
    private let mainLabel = CustomLabel(title: "문제")
    private var quizImageView = UIImageView()
    private let startBtn = CustomButton(title: "시작하기")
    private let progressBar = CustomProgressBar()
    private let passBtn = CustomPassButton(title: "PASS")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "그 사람 누구니"
        view.backgroundColor = UIColor.white
        configureUI()
        
        putRandomWord()
//        NetworkManager.shared.requestPhoto(word: "원빈") { response in
//            switch response {
//            case .success(let person):
//                print("되나보자\(person.items[0].link)")
//            case .failure(let error):
//                print("에러나면 죽어\(error)")
//            }
//        }
    }

}

extension PersonViewController {
    func putRandomWord() {
        guard let randomPerson = Person.shared.movie.randomElement() else {
            ""
            return
        }
        print(randomPerson)
        NetworkManager.shared.requestPhoto(word: randomPerson) { response in
            switch response {
            case .success(let person):
                print(person.items[0].link)
                self.urlToImage(url: person.items[0].link)
            case .failure(let error):
                print("NetworkError: \(error)")
            }
        }
    }
    
    func urlToImage(url: String) {
        guard let url = URL(string: url) else { fatalError() }
        
        // 오래걸리는 작업을 동시성 처리 (다른 쓰레드에서 일시킴)
        DispatchQueue.global().async {
            // URL을 가지고 데이터를 만드는 메서드 (오래걸리는데 동기적인 실행)
            // (일반적으로 이미지를 가져올때 많이 사용)
            guard let data = try? Data(contentsOf: url) else { return }
            
            // 작업의 결과물을 이미로 표시 (메인큐)
            DispatchQueue.main.async {
                self.quizImageView.image = UIImage(data: data)
            }
        }
    }
}

extension PersonViewController {
    @objc func startBtnTapped(_ sender: UIButton) {
        sender.setTitle("다음 문제", for: .normal)
        putRandomWord()
    }
}

//MARK: -UI
extension PersonViewController {
    final private func configureUI() {
        setAttributes()
        addTarget()
        setConstraints()
    }
    
    final private func setAttributes() {
        quizImageView.backgroundColor = CustomColor.mainColor
        quizImageView.layer.cornerRadius = 20
        quizImageView.clipsToBounds = true
        quizImageView.contentMode = .scaleAspectFit
    }
    final private func addTarget() {
        startBtn.addTarget(self, action: #selector(startBtnTapped(_:)), for: .touchUpInside)
    }
    
    final private func setConstraints() {
        [startBtn, passBtn, progressBar, quizImageView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            quizImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quizImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            quizImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            quizImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            quizImageView.heightAnchor.constraint(equalToConstant: 300),
            
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.topAnchor.constraint(equalTo: quizImageView.bottomAnchor, constant: 50),
            progressBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            progressBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
//            progressBar.heightAnchor.constraint(equalTo: mainLabel.heightAnchor),
            
            startBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startBtn.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 50),
            startBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            startBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            startBtn.heightAnchor.constraint(equalToConstant: 50),
            
            passBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passBtn.topAnchor.constraint(equalTo: startBtn.bottomAnchor, constant: 20),
            passBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            passBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            passBtn.heightAnchor.constraint(equalTo: startBtn.heightAnchor),
        ])
    }
}

