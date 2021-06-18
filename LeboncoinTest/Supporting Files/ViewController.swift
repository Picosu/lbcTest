//
//  ViewController.swift
//  LeboncoinTest
//
//  Created by Maxence de Cussac on 16/06/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkManager.retrieveDataFromApi { products in
            print(products)
        }

    }


}

