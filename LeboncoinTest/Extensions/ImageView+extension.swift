//
//  ImageView+extension.swift
//  LeboncoinTest
//
//  Created by Maxence de Cussac on 16/06/2021.
//

import UIKit

extension UIImageView {

    public func imageFromServerURL(urlString: String, PlaceHolderImage: UIImage = UIImage(named: "background")!) {

        if self.image == nil {
            self.image = PlaceHolderImage
        }
        guard !urlString.isEmpty else {
            return
        }
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        }).resume()
    }

    public func imageFromServerURL(url: URL?, PlaceHolderImage: UIImage = UIImage(named: "background")!) {
        guard let unwrappedUrl = url else {
            print("erreur concernant l'url : \(String(describing: url))")
            return
        }
        URLSession.shared.dataTask(with: unwrappedUrl, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        }).resume()
    }

    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }

}
