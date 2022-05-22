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
    var answerButton = CustomButton(title: "시작하기")
    var qAndAText = ""
    var unSelected = ""
    let qaTitle = ["문제", "정답"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "그 대사 뭐니"
        setUI()
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
        [mainLabel,answerButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        answerButton.addTarget(self, action: #selector(answerButton(_:)), for: .touchUpInside)
        mainLabel.numberOfLines = 0
    }
    
    //MARK: - SetLayout
    func setLayout() {
        
        NSLayoutConstraint.activate([
            
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

