//
//  CustomImageView.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/06/04.
//

import UIKit

class CustomImageView: UIImageView {
    var quizTitle = CustomLabel(title: "")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(label title: String) {
        super.init(frame: .zero)
        self.image = UIImage(named: "퀴즈배경")
        setLabel(title: title)
    }
    func setLabel(title: String) {
        self.addSubview(quizTitle)
        quizTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quizTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            quizTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            quizTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            quizTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            quizTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            quizTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
        ])
        quizTitle.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
