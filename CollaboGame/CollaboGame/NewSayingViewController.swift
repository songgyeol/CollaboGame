//
//  NewSayingViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

class NewSayingViewController: UIViewController {
    
    var newSayingView = UIView()
    var newSayingLabel = UILabel()
    var answerButton = UIButton()
    var startButton = UIButton()
    var nextButton = UIButton()
    var qAndAText = ""
    var unSelected = ""
    let qaTitle = ["문제", "정답"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
}

//MARK: - Button Tapped
extension NewSayingViewController {
//    @objc
//    func startButton(_ sender: UIButton) {
//        startButton.isHidden = false
//        answerButton.isHidden = false
//        nextButton.isHidden = false
//
//        qAndAText = NewSaying.shared.newSayingQ["\(qaTitle[0])"]?.randomElement() ?? ""
//        newSayingLabel.text = qAndAText
//    }
    
    
    @objc
    func answerButton(_ sender: UIButton) {
        answerButton.isHidden = true
        nextButton.isHidden = false
        startButton.isHidden = true
        
        let selected =  NewSaying.shared.newSayingA[qAndAText] ?? ""
        unSelected = selected
        newSayingLabel.text = "\(unSelected)"
    }
    
    @objc
    func nextButton(_ sender: UIButton) {
        nextButton.isHidden = true
        startButton.isHidden = true
        answerButton.isHidden = false
        qAndAText = NewSaying.shared.newSayingQ["\(qaTitle[0])"]?.randomElement() ?? ""
        newSayingLabel.text = qAndAText
        newSayingView.isHidden = true
        
    }
    
    
}
//MARK: - Configure
extension NewSayingViewController {
    func setUI() {
        setBasic()
        setLayout()
    }
    
    func setBasic() {
        [newSayingLabel,answerButton,startButton,nextButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        newSayingLabel.text = "신조어 문제풀이"
        newSayingLabel.backgroundColor = UIColor(red:0.59, green:0.45, blue:0.98, alpha:1.0)
        newSayingLabel.textAlignment = .center
        newSayingLabel.textColor = UIColor(red:0.64, green:0.26, blue:0.24, alpha:1.0)
        newSayingLabel.numberOfLines = 5
        newSayingLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        answerButton.setTitle("정답확인", for: .normal)
        answerButton.backgroundColor = UIColor.purple
        answerButton.layer.cornerRadius = 10
        answerButton.sizeToFit()
        answerButton.tintColor = .white
        answerButton.addTarget(self, action: #selector(answerButton(_:)), for: .touchUpInside)
        
//        startButton.setTitle("S T A R T", for: .normal)
//        startButton.backgroundColor = UIColor.purple
//        startButton.layer.cornerRadius = 10
//        startButton.sizeToFit()
//        startButton.tintColor = .white//.clear
//        startButton.addTarget(self, action: #selector(startButton(_:)), for: .touchUpInside)
        
        nextButton.setTitle("N E X T", for: .normal)
        nextButton.backgroundColor = UIColor.purple
        nextButton.layer.cornerRadius = 10
        nextButton.sizeToFit()
        nextButton.tintColor = .white//.clear
        nextButton.addTarget(self, action: #selector(nextButton(_:)), for: .touchUpInside)
        
        
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
            answerButton.heightAnchor.constraint(equalToConstant: 70),
            answerButton.widthAnchor.constraint(equalToConstant: 270),
            
            startButton.topAnchor.constraint(equalTo: newSayingLabel.bottomAnchor, constant: 50),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 70),
            startButton.widthAnchor.constraint(equalToConstant: 270),
            
            nextButton.topAnchor.constraint(equalTo: newSayingLabel.bottomAnchor, constant: 50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 70),
            nextButton.widthAnchor.constraint(equalToConstant: 270),
        ])
    }
    
}
