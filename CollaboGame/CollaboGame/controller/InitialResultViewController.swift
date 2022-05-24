//
//  InitialResultViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/16.
//

import UIKit

class InitialResultViewController: UIViewController {
    
    let initialQuizManager = InitialQuiz.shared
    let resultLable = CustomLabel(title: "", size: 25)
    var resultString = ""
    
    var keyArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        displayResult()
        
        
        
        print("testArray: \(initialQuizManager.testArray)")
    }
    
    func displayResult() {

        for (key, value) in initialQuizManager.resultArray {
            resultString += "\(key) : \(value) \n"
        }
        print(resultString)
        resultLable.text = resultString
    }
//
//    func display() {
//        for (key, value) in initialQuizManager.resultArray {
//            print("key:\(keyArray)")
//            keyArray.append(key)
//        }
//
//        for index in 0..<keyArray.count {
//            let keyIndex = keyArray[index]
//            resultString += "\(keyIndex) : \(initialQuizManager.resultArray[keyIndex])"
//        }
//      print("resultString : \(resultString)")
//     }
}

//MARK: -UI
extension InitialResultViewController {
    final private func configureUI() {
        setAttributes()
        addTarget()
        setConstraints()
    }
    
    final private func setAttributes() {
        resultLable.numberOfLines = 0
    }
    final private func addTarget() {
        
    }
    
    final private func setConstraints() {
        [resultLable].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            resultLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            resultLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            resultLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            resultLable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
