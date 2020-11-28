//
//  ViewController.swift
//  textbook
//
//  Created by Jason Hua on 11/27/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import UIKit

class HomeScreenController: UIViewController {

    var searchButton : UIImageView!
    var homeScreenUITable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .lightGray
        
        //search button
        searchButton = UIImageView()
        searchButton.image = UIImage(named: "search_icon")
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchButton)
        
        
        //UITableView
        //Initialize tableView
        homeScreenUITable = UITableView()
        homeScreenUITable.translatesAutoresizingMaskIntoConstraints = false
        //homeScreenUITable.dataSource = self
        //homeScreenUITable.delegate = self
        //homeScreenUITable.register(OneRestaurantCouponCell.self, forCellReuseIdentifier: couponTableResueCellIdentifier)
        homeScreenUITable.separatorStyle = .none
        homeScreenUITable.showsVerticalScrollIndicator = false
        homeScreenUITable.layer.cornerRadius = 20
        homeScreenUITable.clipsToBounds = true
        view.addSubview(homeScreenUITable)
        
        
        setupConstraints()
        
        
    }

    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchButton.widthAnchor.constraint(equalToConstant: 20),
            searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            searchButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            homeScreenUITable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeScreenUITable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeScreenUITable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeScreenUITable.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        
    }

}

