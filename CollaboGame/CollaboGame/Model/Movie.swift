//
//  Movie.swift
//  CollaboGame
//
//  Created by 송결 on 2022/05/18.
//

import Foundation

class MovieLine {
    static let shared = MovieLine()
    
    let movieA = ["달콤한 인생":"넌 나에게 모욕감을 줬어.",
                  "스물":"거 좀 힘들다고 울어 버릇하지마, 어차피 내일도 힘들어.",
                  "부당거래":"호의가 계속되면 그게 권리인 줄 알아.",
                  "아저씨":"내일만 사는 놈은 오늘만 사는 놈한테 죽는다.",
                  "베테랑":"우리가 돈이 없지, 가오가 없냐.",
    ]
    
    let yearMovie = [
        "달콤한 인생": 2005,
        "스물": 2014,
        "부당거래": 2010,
        "아저씨": 2010,
        "베테랑": 2015
    ]
}
