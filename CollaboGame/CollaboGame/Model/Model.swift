//
//  Model.swift
//  CollaboGame
//
//  Created by 순진이 on 2022/05/15.
//

import Foundation
struct Model {
    let gameTitle: String
    let imageName: String
    let subTitle: String
}

// MARK: - Person
struct PersonModel: Decodable {
    let items: [Item]
}

// MARK: - Item
struct Item: Decodable {
    let link: String
    let thumbnail: String
}



// MARK: - Welcome
struct Movie: Decodable {
    let items: [MovieItem]
}

// MARK: - Item
struct MovieItem: Decodable {
    let image: String
    let director: String
}
