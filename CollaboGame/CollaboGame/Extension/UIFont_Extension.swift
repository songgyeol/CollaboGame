//
//  UIFont_Extension.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/15.
//

import UIKit

extension UIFont {
    class func Pretandard(type: PretandardType, size: CGFloat) -> UIFont! {
        guard let font = UIFont(name: type.name, size: size) else {
            return nil
        }
        return font
    }

    public enum PretandardType {
        case Bold
        case Regular

        var name: String {
            switch self {
            case .Bold:
                return "Pretendard-Bold"
            case .Regular:
                return "Pretendard-Regular"
            }
        }
    }
}

