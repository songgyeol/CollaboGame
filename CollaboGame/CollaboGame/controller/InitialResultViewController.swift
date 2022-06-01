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
    var resultArray: [String]?
    var resultString = ""

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        displayResult()
        print(initialQuizManager.resultArray)
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

extension InitialResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return initialQuizManager.resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InitialTableViewCell.identifier, for: indexPath) as! InitialTableViewCell
        cell.quizLabel.text = initialQuizManager.resultArray[indexPath.row].getInitialLetter()
        cell.answerLabel.text = initialQuizManager.resultArray[indexPath.row]
        return cell
    }
}

//MARK: -UI
extension InitialResultViewController {
    final private func configureUI() {
        setAttributes()
        setTableView()
        setConstraints()
    }
    
    final private func setAttributes() {
        resultLabel.numberOfLines = 0
    }

    final private func setTableView() {
        tableView.dataSource = self
        tableView.register(InitialTableViewCell.self, forCellReuseIdentifier: InitialTableViewCell.identifier)
    }
    
    final private func setConstraints() {
        [tableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
