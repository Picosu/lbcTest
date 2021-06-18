//
//  ImageDecodable.swift
//  LeboncoinTest
//
//  Created by Maxence de Cussac on 18/06/2021.
//

import Foundation

struct ImageUrl: Decodable {

    let small: String?
    let thumb: String?
    
  enum CodingKeys: String, CodingKey {
    case small
    case thumb
  }
}
