//
//  ViewController.swift
//  textbook
//
//  Created by Anya Ji on 11/27/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import UIKit

class HomeScreenController: UIViewController {

    var searchButton : UIImageView!
    var homeScreenUITable: UITableView!
    var homeScreenUITableHeight: CGFloat!
 
    //fake data
    let sellFakeData = [bookData(imageName: "calculus_for_dummies", inputTitle: "Calculus for Dummies", inputAuthor: "Bob Smith", inputCourseName: "Math 101")]
    let exchangeFakeData = [bookData(imageName: "introduction_to_c_programming", inputTitle: "Introduction to C++ programming", inputAuthor: "John Doe", inputCourseName: "CS 101")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .lightGray
        homeScreenUITableHeight = view.frame.height*0.65
        
        //search button
        searchButton = UIImageView()
        searchButton.image = UIImage(named: "search_icon")
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchButton)
        
        
        //UITableView
        //Initialize tableView
        homeScreenUITable = UITableView()
        homeScreenUITable.translatesAutoresizingMaskIntoConstraints = false
        homeScreenUITable.dataSource = self
        homeScreenUITable.delegate = self
        homeScreenUITable.register(HomeScreenTableCell.self, forCellReuseIdentifier: HomeScreenTableCell.homeScreenTableCellIdentifier)
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
            homeScreenUITable.heightAnchor.constraint(equalToConstant: homeScreenUITableHeight)
        ])
        
        
    }

}

extension HomeScreenController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //the first row will be best deals for selling books
        //the second row will be best deals for exchanging books
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeScreenTableCell.homeScreenTableCellIdentifier, for: indexPath) as! HomeScreenTableCell
        
        if indexPath.row == 0{
            cell.configure(rowName: "Best Selling Offer", rowData: sellFakeData)
        }
        
        if indexPath.row == 1{
            cell.configure(rowName: "Best Exchange Offer", rowData: exchangeFakeData)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return homeScreenUITableHeight*0.9/2 //0.9 serves as padding
    }
    
    
}

extension HomeScreenController:UITableViewDelegate{
    
}
