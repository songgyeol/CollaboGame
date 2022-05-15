//
//  MainViewController.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/08.
//

import UIKit

import UIKit

class MainViewController: UIViewController {
    
    let gameTitle = ["그 초성", "그 사자성어", "그 신조어","그 사람", "그 영화", "그 장면"]

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = gameTitle[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(InitialLetterViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(OldSayingViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(NewSayingViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(PersonViewController(), animated: true)
        case 4:            navigationController?.pushViewController(MovieViewController(), animated: true)
        case 5:
            navigationController?.pushViewController(SceneViewController(), animated: true)
        default:
            break
        }
    }
}

//MARK: -UI
extension MainViewController {
    final private func configureUI() {
        setAttributes()
        addTarget()
        setConstraints()
    }
    
    final private func setAttributes() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    final private func addTarget() {
        
    }
    
    final private func setConstraints() {
        [tableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
}
