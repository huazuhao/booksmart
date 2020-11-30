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
    let sellFakeData = [bookData(imageName: "calculus_for_dummies", inputTitle: "Calculus for Dummies", inputAuthor: "Bob Smith", inputCourseName: "Math 101",inputSellType: .sell),bookData(imageName: "international_economics", inputTitle: "International Economics", inputAuthor: "Thomas A. Pugel", inputCourseName: "Econ 201",inputSellType: .sell),bookData(imageName: "introduction_to_psychology", inputTitle: "Introduction To Psychology", inputAuthor: "John Smith", inputCourseName: "PSY 110",inputSellType: .sell)]
    let exchangeFakeData = [bookData(imageName: "introduction_to_c_programming", inputTitle: "Introduction to C++ programming", inputAuthor: "John Doe", inputCourseName: "CS 101",inputSellType: .exchange),bookData(imageName: "NLP_the_essential_guide", inputTitle: "NLP the Essential Guide", inputAuthor: "Tess Johnson", inputCourseName: "CS 401",inputSellType: .exchange)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .lightGray
        homeScreenUITableHeight = view.frame.height*0.6
        
        //search button
        searchButton = UIImageView()
        searchButton.image = UIImage(named: "search_icon")
        searchButton.isUserInteractionEnabled = true
        searchButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.searchTapped)))
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
        homeScreenUITable.alwaysBounceVertical = false
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
            homeScreenUITable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeScreenUITable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeScreenUITable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeScreenUITable.heightAnchor.constraint(equalToConstant: homeScreenUITableHeight)
        ])
        
        
    }
    
    @objc func searchTapped() {
        let newViewController = SearchViewController()
        present(newViewController, animated: true)
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
