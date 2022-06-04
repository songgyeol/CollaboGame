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
        quizTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        quizTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        quizTitle.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
