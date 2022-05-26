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
        case Black
        case ExtraBold
        case ExtraLight
        case Light
        case Medium
        case SemiBold
        case Thin

        var name: String {
            switch self {
            case .Bold:
                return "Pretendard-Bold"
            case .Regular:
                return "Pretendard-Regular"
            case .Black:
                return "Pretendard-Black"
            case .ExtraBold:
                return "Pretendard-ExtraBold"
            case .ExtraLight:
                return "Pretendard-ExtraLight"
            case .Light:
                return "Pretendard-Light"
            case .Medium:
                return "Pretendard-Medium"
            case .SemiBold:
                return "Pretendard-SemiBold"
            case .Thin:
                return "Pretendard-Thin"
                
            }
        }
    }
}

