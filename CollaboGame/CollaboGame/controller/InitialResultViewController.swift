//
//  InitialResultViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/16.
//

import UIKit

class InitialResultViewController: UIViewController {
    
    let initialQuizManager = InitialQuiz.shared
    let resultLabel = CustomLabel(title: "", size: 25)
    var resultString = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        displayResult()
        
    }
    
    func displayResult() {

        for index in 0..<initialQuizManager.resultArray.count {
            resultString += "\(initialQuizManager.resultArray[index].getInitialLetter()) : \(initialQuizManager.resultArray[index]) \n"
        }
        print(resultString)
        resultLabel.text = resultString
        initialQuizManager.resultArray = []
    }
}

//MARK: -UI
extension InitialResultViewController {
    final private func configureUI() {
        setAttributes()
        addTarget()
        setConstraints()
    }
    
    final private func setAttributes() {
        resultLabel.numberOfLines = 0
    }
    final private func addTarget() {
        
    }
    
    final private func setConstraints() {
        [resultLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            resultLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
