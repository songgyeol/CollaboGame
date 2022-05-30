//
//  PersonViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

class PersonViewController: UIViewController {
    
    private let hintLabel = UILabel()
    private let hintButton = UIButton()
    private let mainLabel = CustomLabel(title: "문제")
    private var quizImageView = UIImageView()
    private let startBtn = CustomButton(title: "시작하기")
    private let progressBar = CustomProgressBar()
    private let rightAnswerBtn = CustomPassButton(title: "정답확인")

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
        sender.setTitle("다음 문제", for: .normal)
        Person.shared.getRandomPerson()
        quizImageView.image = UIImage(named: Person.shared.randomPerson)
        hintLabel.text = "힌트가 필요할 때는 ➡️"
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
        
        [hintButton].forEach {
            $0.tintColor = CustomColor.startBtnColor
            $0.layer.cornerRadius = 20
            $0.layer.borderWidth = 2
            $0.layer.borderColor = CustomColor.startBtnColor.cgColor
//            $0.imageView?.contentMode = .scaleAspectFit
//            $0.imageEdgeInsets = .init(top: 10, left: 0, bottom: 10, right: 0)
            hintButton.setTitle("힌트", for: .normal)
            hintButton.setTitleColor(CustomColor.btnTextColor, for: .normal)
        }
        [hintLabel].forEach {
            $0.text = ""
            $0.font = UIFont.Pretandard(type: .Light, size: 20)
            $0.textAlignment = .center
        }
        
        

    }
    final private func addTarget() {
        startBtn.addTarget(self, action: #selector(startBtnTapped(_:)), for: .touchUpInside)
        hintButton.addTarget(self, action: #selector(hintButtonTapped(_:)), for: .touchUpInside)
    }

    final private func setConstraints() {
        let stackView = UIStackView(arrangedSubviews: [hintLabel, hintButton])
        stackView.axis = .horizontal
        stackView.spacing = 5
        
        [stackView, startBtn, rightAnswerBtn, progressBar, quizImageView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            hintButton.widthAnchor.constraint(equalToConstant: 80),
            
            quizImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quizImageView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            quizImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            quizImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            quizImageView.heightAnchor.constraint(equalToConstant: 300),
            
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.topAnchor.constraint(equalTo: quizImageView.bottomAnchor, constant: 30),
            progressBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            progressBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
//            progressBar.heightAnchor.constraint(equalTo: mainLabel.heightAnchor),
            
            startBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startBtn.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 30),
            startBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            startBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            startBtn.heightAnchor.constraint(equalToConstant: 50),
            
            rightAnswerBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rightAnswerBtn.topAnchor.constraint(equalTo: startBtn.bottomAnchor, constant: 20),
            rightAnswerBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            rightAnswerBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            rightAnswerBtn.heightAnchor.constraint(equalTo: startBtn.heightAnchor),
        ])
    }
}

