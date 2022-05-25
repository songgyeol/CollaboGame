//
//  String_Extension.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/22.
//

import Foundation

extension String {
    
    func getInitialLetter() -> String {
        let hangul = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
        var result = ""
        
        // 문자열하나씩 짤라서 확인
        for char in self {
            let octal = char.unicodeScalars[char.unicodeScalars.startIndex].value
            if 44032...55203 ~= octal { // 유니코드가 한글값 일때만 분리작업
                let index = (octal - 0xac00) / 28 / 21
                result = result + hangul[Int(index)]
            }
        }
        return result
    }
}
