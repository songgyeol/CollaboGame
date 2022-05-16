//
//  CustomLabel.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/15.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(title: String, size: CGFloat = 40) {
        super.init(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        font = UIFont.Pretandard(type: .Bold, size: size)
        backgroundColor = CustomColor.mainColor
        clipsToBounds = true
        layer.cornerRadius = 10
        text = title
        textAlignment = .center
        textColor = CustomColor.mainTextColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
