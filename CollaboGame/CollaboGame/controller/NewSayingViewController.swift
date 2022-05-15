//
//  NewSayingViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

class NewSayingViewController: UIViewController {
    
    //    let newsa = CustomLabel(title: "문제")
    //    let startBtn = CustomButton(title: "시작하기")
    //    let progressBar = CustomProgressBar()
    //    let passBtn = CustomPassButton(title: "PASS")
    //
    
    var newSayingView = UIView()
    var newSayingLabel = CustomLabel(title: "신조어", size: 30)
    var answerButton = CustomButton(title: "시작하기")
    var qAndAText = ""
    var unSelected = ""
    let qaTitle = ["문제", "정답"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
}

//MARK: - Button Tapped
extension NewSayingViewController {
    
    @objc
    func answerButton(_ sender: UIButton) {
        
        if sender.currentTitle == "시작하기" {
            answerButton.setTitle("정답확인", for: .normal)
            answerButton.setTitleColor(.yellow, for: .normal)
            qAndAText = NewSaying.shared.newSayingQ["\(qaTitle[0])"]?.randomElement() ?? ""
            newSayingLabel.text = qAndAText
            newSayingView.isHidden = true
        } else if sender.currentTitle == "정답확인" {
            newSayingLabel.textColor = .yellow
            answerButton.setTitle("다음문제", for: .normal)
            
            let selected =  NewSaying.shared.newSayingA[qAndAText] ?? ""
            unSelected = selected
            newSayingLabel.text = "\(unSelected)"
            
            answerButton.setTitleColor(CustomColor.btnTextColor, for: .normal)
        } else if sender.currentTitle == "다음문제" {
            newSayingLabel.textColor = .white
            answerButton.setTitle("정답확인", for: .normal)
            qAndAText = NewSaying.shared.newSayingQ["\(qaTitle[0])"]?.randomElement() ?? ""
            answerButton.setTitleColor(.yellow, for: .normal)
            newSayingLabel.text = qAndAText
            newSayingView.isHidden = true
        }
        
        
    }
    
    
    
}
//MARK: - Configure
extension NewSayingViewController {
    func setUI() {
        setBasic()
        setLayout()
    }
    
    func setBasic() {
        [newSayingLabel,answerButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        answerButton.addTarget(self, action: #selector(answerButton(_:)), for: .touchUpInside)
        
        newSayingLabel.numberOfLines = 0
    }
    
    //MARK: - SetLayout
    func setLayout() {
        
        NSLayoutConstraint.activate([
            
            newSayingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newSayingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
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
