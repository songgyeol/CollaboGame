//
//  NetworkManager.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/19.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func requestPhoto(word: String, completion: @escaping (Result<PersonModel, AFError>) -> Void) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/image?") else { fatalError() }
        
        let parameter: Parameters = [
            "display": 1,
            "query": "\(word)",
            "sort": "sim"
        ]
        
        let header: HTTPHeaders = [
            "X-Naver-Client-Id": "TUWSiHEpK6xMQCi8Jqrq",
            "X-Naver-Client-Secret": "1dLbA5yVLN"
        ]
        
        AF.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: header).validate(statusCode: 200..<300).responseDecodable(of: PersonModel.self) { response in
            completion(response.result)
        }
    }
}
