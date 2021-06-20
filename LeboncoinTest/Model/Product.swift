//
//  ProductDecodable.swift
//  LeboncoinTest
//
//  Created by Maxence de Cussac on 17/06/2021.
//

import Foundation

struct Product: Decodable {

    let id: Int
    let title: String
    let description: String
    let categoryId: Int
    let price: StringOrDouble
    let creationDate: String
    let isUrgent: Bool
    let imageUrl: ImageUrl // For debug purpose commented
    
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case description
    case categoryId = "category_id"
    case price
    case creationDate = "creation_date"
    case isUrgent = "is_urgent"
    case imageUrl = "images_url"
  }

}
