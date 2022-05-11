//
//  NewSayingViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

class NewSayingViewController: UIViewController {
    
    var newSayingLabel = UILabel()
    var answerButton = UIButton()
    var startButton = UIButton()
    var nextButton = UIButton()
    var qAndAText = ""
    var unSelected = ""
    let qAndALabel = UILabel()
    let qaTitle = ["문제", "정답"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
}

//MARK: - Button Tapped
extension NewSayingViewController {
    @objc
    func startButton(_ sender: UIButton) {
        startButton.isHidden = true
        nextButton.isHidden = false
        answerButton.isHidden = false
        qAndAText = NewSaying.shared.newSayingQ["\(qaTitle[0])"]?.randomElement() ?? ""
        //movieView.isHidden = true
        qAndALabel.text = qAndAText
    }
    

@objc
func answerButton(_ sender: UIButton) {
    answerButton.isHidden = true
    let selected =  NewSaying.shared.newSayingA["\(qAndAText)"] ?? ""
    unSelected = selected
    qAndALabel.text = "\(unSelected)"
}

}
//MARK: - Configure
extension NewSayingViewController {
    func setUI() {
        setBasic()
        setLayout()
    }
    
    func setBasic() {
        [newSayingLabel,answerButton,startButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        newSayingLabel.text = "신조어"
        newSayingLabel.backgroundColor = UIColor(red:0.59, green:0.45, blue:0.98, alpha:1.0)
        newSayingLabel.textAlignment = .center
        newSayingLabel.textColor = UIColor(red:0.64, green:0.26, blue:0.24, alpha:1.0)
        newSayingLabel.numberOfLines = 8
        newSayingLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        answerButton.setTitle("정답확인", for: .normal)
        answerButton.backgroundColor = UIColor(red:0.59, green:0.45, blue:0.98, alpha:1.0)
        answerButton.tintColor = .white
        //answerButton.addTarget(self, action: #selector(answerButton(_:)), for: .touchUpInside)
        
        startButton.setTitle("N E X T", for: .normal)
        startButton.backgroundColor = UIColor.purple
        startButton.layer.cornerRadius = 10
        startButton.sizeToFit()
        startButton.tintColor = .white//.clear
        startButton.addTarget(self, action: #selector(startButton(_:)), for: .touchUpInside)
        
    }
    
    //MARK: - SetLayout
    func setLayout() {
        NSLayoutConstraint.activate([
            newSayingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            newSayingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newSayingLabel.heightAnchor.constraint(equalToConstant:300),
            newSayingLabel.widthAnchor.constraint(equalToConstant: 270),
            
            answerButton.topAnchor.constraint(equalTo: newSayingLabel.bottomAnchor, constant: 50),
            answerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerButton.heightAnchor.constraint(equalToConstant: 50),
            answerButton.widthAnchor.constraint(equalToConstant: 150),
            
            startButton.topAnchor.constraint(equalTo: answerButton.bottomAnchor, constant: 50),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 70),
            startButton.widthAnchor.constraint(equalToConstant: 270)
            
            
        ])
    }
    //MARK: - StartButtonTapped
    //    @objc func startBT(_ uibutton: Any) {
    //        if let newSay = newSaying.randomElement() {
    //            self.newSayingLabel.text = newSay
    //        }
    //    }
    //    @objc func answerBT(_ uibutton: Any) {
    //        if let newSay = newSaying.randomElement() {
    //            self.newSayingLabel.text = newSay
    //        }
    //    }
    
    
    
}
