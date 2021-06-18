//
//  Constants.swift
//  LeboncoinTest
//
//  Created by Maxence de Cussac on 16/06/2021.
//

import Foundation

// MARK: - Environment
enum Environment: String {
    case dev = "dev"
    case prod = "prod"
    case contentList = "contentList"
    case categoryList = "categoryList"

    var lbcServerURL: String {
        switch self {
        case .contentList: return "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"
        case .categoryList: return "https://gateway.marvel.com/"
        default: return "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"
        }
    }


}

// MARK: - Configuration (for debug purpose)
struct Configuration {
    lazy var environment: Environment = {
        #if DEBUG
        return Environment.dev
        #else
        return Environment.prod
        #endif
    }()

}
