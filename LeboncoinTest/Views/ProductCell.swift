//
//  ProductCell.swift
//  LeboncoinTest
//
//  Created by Maxence de Cussac on 20/06/2021.
//

import Foundation
import UIKit

class ProductCell : UITableViewCell {
    
    var product : Product? {
        didSet {
            productNameLabel.text = product?.title
            productDescriptionLabel.text = product?.description
            productPrice.text = "\(String(describing: product?.price)) €"
            
            var urlImage: URL
            if let thumb = product?.imageUrl.thumb, let urlImage = URL(string: thumb) {
                NetworkManager.retrieveImageFromUrl(fromUrl: urlImage) { image in
                    self.productImage.image = image
                }
    
            }
            else if let small = product?.imageUrl.small, let urlImage = URL(string: small) {
                NetworkManager.retrieveImageFromUrl(fromUrl: urlImage) { image in
                    self.productImage.image = image
                }
            } else {
                return
            }
            
        }
    }
    
    
    private let productNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let productDescriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    var productPrice : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "1"
        label.textColor = .black
        return label
        
    }()
    
    private let productImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productImage)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productDescriptionLabel)
        contentView.addSubview(productPrice)
        
        productImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        productImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
