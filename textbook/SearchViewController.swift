//
//  SearchViewController.swift
//  textbook
//
//  Created by Jessica Wu on 11/29/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchCollectionView: UICollectionView!
    
    let searchCellReuseIdentifier = "searchCellReuseIdentifier"
    let padding: CGFloat = 10
    var filteredBooks: [bookData] = []
    // array holds fake data, remove later
    var books: [bookData] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        //fake data
        books = [bookData(imageName: "calculus_for_dummies", inputTitle: "Calculus for Dummies", inputAuthor: "Bob Smith", inputCourseName: "Math 101",inputSellType: .sell), bookData(imageName: "international_economics", inputTitle: "International Economics", inputAuthor: "Thomas A. Pugel", inputCourseName: "Econ 201",inputSellType: .sell),bookData(imageName: "introduction_to_psychology", inputTitle: "Introduction To Psychology", inputAuthor: "John Smith", inputCourseName: "PSY 110",inputSellType: .sell),bookData(imageName: "introduction_to_c_programming", inputTitle: "Introduction to C++ programming", inputAuthor: "John Doe", inputCourseName: "CS 101",inputSellType: .exchange),bookData(imageName: "NLP_the_essential_guide", inputTitle: "NLP the Essential Guide", inputAuthor: "Tess Johnson", inputCourseName: "CS 401",inputSellType: .exchange)]
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
        //search bar
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by ISBN, Title, or Author's Name"
        searchController.searchBar.showsCancelButton = true
        definesPresentationContext = true
        
        //collectionView
        let searchLayout = UICollectionViewFlowLayout()
        searchLayout.scrollDirection = .vertical
        searchLayout.minimumLineSpacing = padding
        
        searchCollectionView = UICollectionView(frame: .zero , collectionViewLayout: searchLayout)
        searchCollectionView.backgroundColor = .white
        searchCollectionView.register(HomeScreenCollectionViewCell.self, forCellWithReuseIdentifier: searchCellReuseIdentifier)
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        searchCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchCollectionView)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            searchCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            searchCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            searchCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding),
            searchCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: padding)
        ])
        
    }
    
    // test if this works later, haven't checked yet
    func filterForSearchText(_ searchText: String) {
        
        filteredBooks = books.filter { (book: bookData) -> Bool in
            // temporary return value; ideally, each book info will be presented
            // as a string which will be used to filter
            return book.author.lowercased().contains(searchText.lowercased())
        }
        
    searchCollectionView.reloadData()
    }
}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterForSearchText(searchBar.text!)
    }
    
}

extension SearchViewController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchCellReuseIdentifier, for: indexPath) as! HomeScreenCollectionViewCell
        cell.configure(inputbookData: filteredBooks[indexPath.item])
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO, will push screen containing book info
    }
}
