//
//  NewSayingViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

class NewSayingViewController: UIViewController {
    
    private var mainImageView = CustomImageView(label: "신조어")
    //var titleLabel = CustomLabel(title: "신조어", size: 25)
    //var newSayingLabel = CustomLabel(title: "신조어 맞추기", size: 30)
    private var startButton = UIButton(type: .custom)
    private var rightAnswerButton = UIButton(type: .custom)
    private let progressBar = CustomProgressBar()
    private var timerLabel = UILabel()
    
    
    var qAndAText = ""
    var unSelected = ""
    let qaTitle = ["문제", "정답"]
    
    let startImage = UIImage(named: "시작하기_초록")
    let nextQuestionImage = UIImage(named: "다음문제_초록")
    let answerImage = UIImage(named: "정답확인_노랑")

//MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "그 말 뭐니"
        setUI()
    }
}

//MARK: - Selector
extension NewSayingViewController {
    
    @objc
    func answerButton(_ sender: UIButton) {
        
//        if sender.currentTitle == "시작하기" {
//            startButton.setTitle("정답확인", for: .normal)
//            startButton.setTitleColor(.yellow, for: .normal)
//            qAndAText = NewSaying.shared.newSayingQ["\(qaTitle[0])"]?.randomElement() ?? ""
//            print(qAndAText)
//            newSayingLabel.text = qAndAText
//            newSayingView.isHidden = true
//        } else if sender.currentTitle == "정답확인" {
//            titleLabel.text = qAndAText
//            titleLabel.textColor = UIColor(red:0.98, green:0.96, blue:0.43, alpha:1.0)
//            newSayingLabel.textColor = UIColor(red:0.98, green:0.96, blue:0.43, alpha:1.0)
//            startButton.setTitle("다음문제", for: .normal)
//
//            let selected =  NewSaying.shared.newSayingA[qAndAText] ?? ""
//            unSelected = selected
//            newSayingLabel.text = "\(unSelected)"
//
//            startButton.setTitleColor(CustomColor.btnTextColor, for: .normal)
//        } else if sender.currentTitle == "다음문제" {
//            titleLabel.text = "신조어"
//            titleLabel.textColor = CustomColor.mainTextColor
//            newSayingLabel.textColor = CustomColor.mainTextColor
//            startButton.setTitle("정답확인", for: .normal)
//            qAndAText = NewSaying.shared.newSayingQ["\(qaTitle[0])"]?.randomElement() ?? ""
//            startButton.setTitleColor(UIColor(red:0.98, green:0.96, blue:0.43, alpha:1.0), for: .normal)
//            newSayingLabel.text = qAndAText
//            newSayingView.isHidden = true
//        }
//
        
    }
    
    
    
}
//MARK: - UI
extension NewSayingViewController {
    func setUI() {
        setBasic()
        setLayout()
    }
    
    func setBasic() {

        startButton.addTarget(self, action: #selector(answerButton(_:)), for: .touchUpInside)

        startButton.setImage(startImage, for: .normal)
        rightAnswerButton.setImage(answerImage, for: .normal)
    }
 
    func setLayout() {
        let stackView = UIStackView(arrangedSubviews: [startButton, rightAnswerButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        [mainImageView, timerLabel, stackView, progressBar].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            mainImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            mainImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 320),
            
           
            timerLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 30),
            timerLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            progressBar.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 30),
            progressBar.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            progressBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            progressBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            
            
            stackView.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 80),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            
            startButton.heightAnchor.constraint(equalToConstant: 70),
            rightAnswerButton.heightAnchor.constraint(equalToConstant: 70),
            
        ])
    }
    
}
