//
//  CustomButton.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/15.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    init(title: String, size: CGFloat = 30) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        backgroundColor = CustomColor.startBtnColor
        setTitleColor(CustomColor.btnTextColor, for: .normal)
        titleLabel?.font = UIFont.Pretandard(type: .Regular, size: size)
        layer.cornerRadius = 20
        clipsToBounds = true
        layer.borderWidth = 7
        layer.borderColor = UIColor.white.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomPassButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    init(title: String, size: CGFloat = 30) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        backgroundColor = CustomColor.passBtnColor
        setTitleColor(CustomColor.btnTextColor, for: .normal)
        titleLabel?.font = UIFont.Pretandard(type: .Regular, size: size)
        layer.cornerRadius = 20
        layer.borderWidth = 7
        layer.borderColor = UIColor.white.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

