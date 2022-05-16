//
//  PersonViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

class PersonViewController: UIViewController {
    let mainLabel = CustomLabel(title: "문제")
    let startBtn = CustomButton(title: "시작하기")
    let progressBar = CustomProgressBar()
    let passBtn = CustomPassButton(title: "PASS")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "그 사람 누구니"
        view.backgroundColor = UIColor.white
        configureUI()
        
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
        
    }
    final private func addTarget() {
        
    }
    
    final private func setConstraints() {
        [mainLabel, startBtn, passBtn, progressBar].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            mainLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            mainLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            mainLabel.heightAnchor.constraint(equalToConstant: 300),
            
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 50),
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

