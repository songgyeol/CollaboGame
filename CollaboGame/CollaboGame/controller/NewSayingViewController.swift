//
//  NewSayingViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

class NewSayingViewController: UIViewController {
    
    var newSayingView = UIView()
    var titleLabel = CustomLabel(title: "신조어", size: 25)
    var newSayingLabel = CustomLabel(title: "신조어 맞추기", size: 30)
    var answerButton = CustomButton(title: "시작하기", size: 20)
    var qAndAText = ""
    var unSelected = ""
    let qaTitle = ["문제", "정답"]

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
        
        if sender.currentTitle == "시작하기" {
            answerButton.setTitle("정답확인", for: .normal)
            answerButton.setTitleColor(.yellow, for: .normal)
            qAndAText = NewSaying.shared.newSayingQ["\(qaTitle[0])"]?.randomElement() ?? ""
            print(qAndAText)
            newSayingLabel.text = qAndAText
            newSayingView.isHidden = true
        } else if sender.currentTitle == "정답확인" {
            titleLabel.text = qAndAText
            titleLabel.textColor = UIColor(red:0.98, green:0.96, blue:0.43, alpha:1.0)
            newSayingLabel.textColor = UIColor(red:0.98, green:0.96, blue:0.43, alpha:1.0)
            answerButton.setTitle("다음문제", for: .normal)
            
            let selected =  NewSaying.shared.newSayingA[qAndAText] ?? ""
            unSelected = selected
            newSayingLabel.text = "\(unSelected)"
            
            answerButton.setTitleColor(CustomColor.btnTextColor, for: .normal)
        } else if sender.currentTitle == "다음문제" {
            titleLabel.text = "신조어"
            titleLabel.textColor = CustomColor.mainTextColor
            newSayingLabel.textColor = CustomColor.mainTextColor
            answerButton.setTitle("정답확인", for: .normal)
            qAndAText = NewSaying.shared.newSayingQ["\(qaTitle[0])"]?.randomElement() ?? ""
            answerButton.setTitleColor(UIColor(red:0.98, green:0.96, blue:0.43, alpha:1.0), for: .normal)
            newSayingLabel.text = qAndAText
            newSayingView.isHidden = true
        }
        
        
    }
    
    
    
}
//MARK: - UI
extension NewSayingViewController {
    func setUI() {
        setBasic()
        setLayout()
    }
    
    func setBasic() {
        [titleLabel,newSayingLabel,answerButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        answerButton.addTarget(self, action: #selector(answerButton(_:)), for: .touchUpInside)
        newSayingLabel.numberOfLines = 0
    }
 
    func setLayout() {
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            
            newSayingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newSayingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            newSayingLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            newSayingLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            newSayingLabel.heightAnchor.constraint(equalToConstant: 300),
            
            answerButton.topAnchor.constraint(equalTo: newSayingLabel.bottomAnchor, constant: 50),
            answerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerButton.heightAnchor.constraint(equalToConstant: 70),
            answerButton.widthAnchor.constraint(equalToConstant: 270),
        ])
    }
    
}
