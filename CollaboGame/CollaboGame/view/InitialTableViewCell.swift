//
//  InitialTableViewCell.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/30.
//

import UIKit


class InitialTableViewCell: UITableViewCell {
    
    // MARK: -Properties
    static let identifier = "InitialTableViewCell"
    
    var quizLabel = UILabel()
    var answerLabel = UILabel()
    
    // MARK: -Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: -UI
extension InitialTableViewCell {
    private func setUI() {
        [quizLabel, answerLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            quizLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            quizLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            answerLabel.leadingAnchor.constraint(equalTo: quizLabel.trailingAnchor, constant: 30),
            answerLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
