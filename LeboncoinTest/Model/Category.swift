//
//  Category.swift
//  LeboncoinTest
//
//  Created by Maxence de Cussac on 18/06/2021.
//

import Foundation

struct Category: Decodable {
  let id: Int
  let name: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
  }
    
}
