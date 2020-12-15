//
//  ViewController.swift
//  textbook
//
//  Created by Anya Ji on 11/27/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import UIKit

class HomeScreenController: UIViewController {

    let searchControllerOne = UISearchController(searchResultsController: nil)
    var homeScreenUITable: UITableView!
    var homeScreenUITableHeight: CGFloat!
    var refreshControl = UIRefreshControl()
    
    
    var recentlyAdded: [Book] = []
    var lowestSellingPrice: [Book] = []
 
    //fake data
    let addedFakeData = [bookData(imageName: "calculus_for_dummies", inputTitle: "Calculus for Dummies", inputAuthor: "Bob Smith", inputCourseName: "Math 101",inputSellType: .sell,inputSellPrice: 100),bookData(imageName: "international_economics", inputTitle: "International Economics", inputAuthor: "Thomas A. Pugel", inputCourseName: "Econ 201",inputSellType: .sell,inputSellPrice: 200),bookData(imageName: "introduction_to_psychology", inputTitle: "Introduction To Psychology", inputAuthor: "John Smith", inputCourseName: "PSY 110",inputSellType: .sell,inputSellPrice: 300)]
    let lowestFakeData = [bookData(imageName: "introduction_to_c_programming", inputTitle: "Introduction to C++ programming", inputAuthor: "John Doe", inputCourseName: "CS 101",inputSellType: .exchange,inputSellPrice: 0),bookData(imageName: "NLP_the_essential_guide", inputTitle: "NLP the Essential Guide", inputAuthor: "Tess Johnson", inputCourseName: "CS 401",inputSellType: .exchange,inputSellPrice: 0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupBackground()
        homeScreenUITableHeight = view.frame.height*0.6
        
        navigationItem.searchController = searchControllerOne
        searchControllerOne.searchResultsUpdater = self
        searchControllerOne.hidesNavigationBarDuringPresentation = false
        searchControllerOne.obscuresBackgroundDuringPresentation = false
        searchControllerOne.searchBar.placeholder = "Search by ISBN, Title, or Author's Name"
        searchControllerOne.searchBar.showsCancelButton = true
        searchControllerOne.searchBar.searchTextField.delegate = self
        definesPresentationContext = true
        
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
        homeScreenUITable.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.addSubview(homeScreenUITable)
        
//        //refresh
//        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
//        homeScreenUITable.refreshControl = refreshControl
//
        
        getAll()
        setupConstraints()
        
        
    }

    override func viewDidAppear(_ animated: Bool){
        updateAll()
    }
    
    func setupBackground() {
        let background = UIImage(named: "white_background")
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.image = background
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func setupConstraints(){

        NSLayoutConstraint.activate([
            homeScreenUITable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeScreenUITable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeScreenUITable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeScreenUITable.heightAnchor.constraint(equalToConstant: homeScreenUITableHeight)
        ])
        
        
    }
    
    
    private func getAll(){
        var allFromBackend : [Book] = []
        
        NetworkManager.getAll{ books in
            allFromBackend = books
            for item in allFromBackend{
                var newItem = item
                print("handle default image")
                
                self.lowestSellingPrice.append(newItem)
                self.recentlyAdded.append(newItem)
            }

            self.recentlyAdded = self.recentlyAdded.sorted(by: { $0.createdAt > $1.createdAt })
            self.lowestSellingPrice = self.lowestSellingPrice.sorted(by: { $0.price < $1.price })
            
            //reload
            DispatchQueue.main.async {
                self.homeScreenUITable.reloadData()
            }
        }
    }
    
    func updateAll(){
        
        print("update recently added")
        
        var allFromBackend : [Book] = []
        
        NetworkManager.getAll{ books in
            allFromBackend = books
            for item in allFromBackend{
                var newItem = item
                print("handle default image")
    
                if self.recentlyAdded.contains(newItem) == false {
                    print("this is the new item")
                    print(newItem)
                    self.recentlyAdded.append(newItem)
                }
                
                if self.lowestSellingPrice.contains(newItem) == false {
                    self.lowestSellingPrice.append(newItem)
                }
                
            }
            
            self.recentlyAdded = self.recentlyAdded.sorted(by: { $0.createdAt > $1.createdAt })
            self.lowestSellingPrice = self.lowestSellingPrice.sorted(by: { $0.price < $1.price })
            
            //reload
            DispatchQueue.main.async {
                self.homeScreenUITable.reloadData()
            }
        }
    }
    
//    @objc func refresh(_ sender: AnyObject) {
//       // Code to refresh
//        updateRecentlyAdded()
//        refreshControl.endRefreshing()
//    }
    
    
    func filterForSearchText(_  searchText: String) {
        // Intentionally Left Empty
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
            cell.configure(rowName: "Recently Added", rowData: self.recentlyAdded)
            cell.newScreenDelegate = self
        }
        
        if indexPath.row == 1{
            cell.configure(rowName: "Lowest Selling Price", rowData: self.lowestSellingPrice)
            cell.newScreenDelegate = self
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return homeScreenUITableHeight*0.9/2 //0.9 serves as padding
    }
    
    
}

extension HomeScreenController:UITableViewDelegate{
    
}

extension HomeScreenController:ShowProductInfoProtocol{
    
    func showProductInfoProtocol(inputBook: Book) {
        
        let productInfo = ProductInfoViewController(inputBook: inputBook)
        navigationController?.pushViewController(productInfo, animated: true)
    }
}
    
extension HomeScreenController: UISearchResultsUpdating {
        
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterForSearchText(searchBar.text!)
    }
}

extension HomeScreenController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let newViewController = SearchViewController(initialText: textField.text)
        navigationController?.pushViewController(newViewController, animated: true)
        
        return true
    }
}
