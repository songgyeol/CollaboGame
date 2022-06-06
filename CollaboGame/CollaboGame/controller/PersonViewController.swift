//
//  PersonViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

class PersonViewController: UIViewController {
    
    private let hintLabel = UILabel()
    private let hintButton = UIButton(type: .custom)
    
    
    private var mainImageView = CustomImageView(label: "인물 맞추기")
    private let startButton = UIButton(type: .custom)
    private let rightAnswerButton = UIButton(type: .custom)
    private let timerLabel = UILabel()
    private let progressBar = CustomProgressBar()
    //private let rightAnswerBtn = CustomPassButton(title: "정답확인")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "그 사람 누구니"
        view.backgroundColor = UIColor.white
        configureUI()
    }
}

extension PersonViewController {
    @objc func hintButtonTapped(_ sender: UIButton) {
        hintLabel.text = Person.shared.randomPerson.getInitialLetter()
    }
    
    @objc func startBtnTapped(_ sender: UIButton) {
        sender.setImage(ButtonImage.nextQuestionImage, for: .normal)
        Person.shared.getRandomPerson()
        mainImageView.image = UIImage(named: Person.shared.randomPerson)
        mainImageView.layer.borderWidth = 2
        
        hintLabel.text = "힌트가 필요할 때는 ➡️"
        mainImageView.quizTitle.text = ""
        timerLabel.isHidden = true
        progressBar.isHidden = false
    }
    
    @objc func answerBtnTapped(_ sender: UIButton) {
        mainImageView.image = UIImage(named: "메인배경")
        mainImageView.quizTitle.text = Person.shared.randomPerson
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
        [hintLabel].forEach {
            $0.text = ""
            $0.font = UIFont.Pretandard(type: .Light, size: 20)
            $0.textAlignment = .center
        }
        
        progressBar.isHidden = true
        timerLabel.text = "제한 시간: 30초"
        timerLabel.textColor = .black
        timerLabel.textAlignment = .center
        hintButton.setImage(ButtonImage.hintImage, for: .normal)
        startButton.setImage(ButtonImage.startImage, for: .normal)
        rightAnswerButton.setImage(ButtonImage.answerImage, for: .normal)

    }
    final private func addTarget() {
        startButton.addTarget(self, action: #selector(startBtnTapped(_:)), for: .touchUpInside)
        hintButton.addTarget(self, action: #selector(hintButtonTapped(_:)), for: .touchUpInside)
        rightAnswerButton.addTarget(self, action: #selector(answerBtnTapped(_:)), for: .touchUpInside)
    }

    final private func setConstraints() {
        let hintStack = UIStackView(arrangedSubviews: [hintLabel, hintButton])
        hintStack.axis = .horizontal
        hintStack.spacing = 5
        
        let buttonStack = UIStackView(arrangedSubviews: [startButton, rightAnswerButton])
        buttonStack.axis = .vertical
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 10
        
        
        [hintStack, mainImageView, timerLabel, progressBar, buttonStack].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            hintStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            hintStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            hintStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            hintStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            hintStack.heightAnchor.constraint(equalToConstant: 50),
            
            hintButton.widthAnchor.constraint(equalToConstant: 80),
            
            mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImageView.topAnchor.constraint(equalTo: hintStack.bottomAnchor, constant: 10),
            mainImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            mainImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            mainImageView.heightAnchor.constraint(equalToConstant: 350),
            
            timerLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 20),
            timerLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            timerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            timerLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            timerLabel.heightAnchor.constraint(equalToConstant: 20),
            
            progressBar.topAnchor.constraint(equalTo: timerLabel.topAnchor),
            progressBar.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            progressBar.leadingAnchor.constraint(equalTo: timerLabel.leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: timerLabel.trailingAnchor),

            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 15),
            buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
//            startButton.heightAnchor.constraint(equalToConstant: 70),
//            rightAnswerButton.heightAnchor.constraint(equalToConstant: 70)
            
            
        ])
    }
}

