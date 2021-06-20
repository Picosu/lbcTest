//
//  ViewController.swift
//  LeboncoinTest
//
//  Created by Maxence de Cussac on 16/06/2021.
//

import UIKit

class ProductsViewController: UIViewController {
    
    /// Variables
    var productsTableView: UITableView?
    
    var products = [Product]() {
        didSet {
            self.refreshTableView()
        }
    }
    
    let productCellReuseIdentifier = "productReuseIdentifier"
    
    /// Methods
    func refreshTableView() {
        DispatchQueue.main.async(execute: {
            self.productsTableView?.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.createTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkManager.retrieveDataFromApi { products in
            print(products)
            self.products = products
        }

    }
    
    func createTableView() {
        let tableView: UITableView = UITableView()
        tableView.frame = CGRect(x: 10, y: 10, width: view.frame.size.width, height: view.frame.size.height)
        tableView.dataSource = self
        tableView.delegate = self

        self.productsTableView = tableView
        
        self.view.addSubview(tableView)

        productsTableView?.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        productsTableView?.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        productsTableView?.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        productsTableView?.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        productsTableView?.register(UITableViewCell.self, forCellReuseIdentifier: productCellReuseIdentifier)

    }
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: productCellReuseIdentifier)
        
        cell.textLabel?.text = products[indexPath.row].title
        cell.detailTextLabel?.text = "\(products[indexPath.row].price) €"
        
        return cell
    }
}
