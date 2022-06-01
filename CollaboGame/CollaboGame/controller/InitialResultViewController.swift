//
//  InitialResultViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/16.
//

import UIKit

class InitialResultViewController: UIViewController {
    
    let initialQuizManager = InitialQuiz.shared
    var resultArray: [String] = []


    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.title = "정답확인"

    }

}

extension InitialResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InitialTableViewCell.identifier, for: indexPath) as! InitialTableViewCell
        cell.quizLabel.text = resultArray[indexPath.row].getInitialLetter()
        cell.answerLabel.text = resultArray[indexPath.row]
        return cell
    }
}

//MARK: -UI
extension InitialResultViewController {
    final private func configureUI() {
        setTableView()
        setConstraints()
    }


    final private func setTableView() {
        tableView.dataSource = self
        tableView.rowHeight = 40
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
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
