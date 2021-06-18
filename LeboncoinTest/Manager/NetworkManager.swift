//
//  NetworkManager.swift
//  LeboncoinTest
//
//  Created by Maxence de Cussac on 14/06/2021.
//

import Foundation
import UIKit

/// Alias for Jsons
typealias GenericJson = [String:Any]

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()

    var configuration = Configuration()
    class func retrieveDataFromUrl(fromUrl url:URL, callBack: @escaping (UIImage) -> ()) {
        
        let req = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
            if let data = data {
                if let image = UIImage(data: data) {
                    callBack(image)
                }
            } else {
                print("Error while retrieving data from url :\(url)")
            }
        }
        
        task.resume()
    }
    // MARK :- Public methods
    
    class func retrieveDataFromApi(callBack: @escaping ([Product]) -> ()) {
        var configuration = Configuration()
        guard let url = URL(string: configuration.environment.lbcServerURL) else {
            return;
        }
        
        let req = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
            if let data = data {
                if data.isEmpty {
                    callBack([Product]())
                }
                let decoder = JSONDecoder()
                do {
                    let products = try decoder.decode([Product].self, from: data)
                    callBack(products)
                } catch {
                    print("JSONSerialization error:", error)
                }
            } else {
                print("Error while retrieving data from url :\(url)")
            }
        }
        
        task.resume()
    }
}
