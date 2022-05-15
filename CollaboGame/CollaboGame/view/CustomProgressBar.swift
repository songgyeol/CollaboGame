//
//  CustomProgressBar.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/15.
//

import Foundation
import UIKit


class CustomProgressBar: UIProgressView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        progress = 0.5
        backgroundColor = CustomColor.passBtnColor
        progressTintColor = CustomColor.mainColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
