//
//  SearchViewController.swift
//  textbook
//
//  Created by Jessica Wu on 12/11/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    let searchControllerOne = UISearchController(searchResultsController: nil)
    var initialText: String
    var resultLabel: UILabel!
    var resultNumberLabel: UILabel!
    var searchTableView: UITableView!
    let searchCellReuseIdentifier = "searchCellReuseIdentifier"
    var filteredBooks: [bookData] = []
        
    // array holds fake data, remove later
    var books: [bookData] = []
        
    init(initialText: String?) {
        self.initialText = initialText ?? ""
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        
        self.view.backgroundColor = .white
        self.title = "Home"
        
        //fake data
        books = [bookData(imageName: "calculus_for_dummies", inputTitle: "Calculus for Dummies", inputAuthor: "Bob Smith", inputCourseName: "Math 101",inputSellType: .sell,inputSellPrice: 100),bookData(imageName: "international_economics", inputTitle: "International Economics", inputAuthor: "Thomas A. Pugel", inputCourseName: "Econ 201",inputSellType: .sell,inputSellPrice: 200),bookData(imageName: "introduction_to_psychology", inputTitle: "Introduction To Psychology", inputAuthor: "John Smith", inputCourseName: "PSY 110",inputSellType: .sell,inputSellPrice: 300),bookData(imageName: "introduction_to_c_programming", inputTitle: "Introduction to C++ programming", inputAuthor: "John Doe", inputCourseName: "CS 101",inputSellType: .exchange,inputSellPrice: 0),bookData(imageName: "NLP_the_essential_guide", inputTitle: "NLP the Essential Guide", inputAuthor: "Tess Johnson", inputCourseName: "CS 401",inputSellType: .exchange,inputSellPrice: 0)]
        
        navigationItem.searchController = searchControllerOne
        searchControllerOne.searchResultsUpdater = self
        searchControllerOne.hidesNavigationBarDuringPresentation = false
        searchControllerOne.obscuresBackgroundDuringPresentation = false
        searchControllerOne.searchBar.placeholder = "Search by ISBN, Title, or Author's Name"
        searchControllerOne.searchBar.text = initialText
        searchControllerOne.searchBar.showsCancelButton = true
        definesPresentationContext = true
        
        searchTableView = UITableView()
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: searchCellReuseIdentifier)
        searchTableView.translatesAutoresizingMaskIntoConstraints = false
        searchTableView.separatorStyle = .none
        view.addSubview(searchTableView)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
        resultLabel = UILabel()
        resultLabel.textColor = .black
        resultLabel.font = .boldSystemFont(ofSize: 28)
        resultLabel.text = "Search Results"
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)
        
        resultNumberLabel = UILabel()
        resultNumberLabel.textColor = .black
        resultNumberLabel.font = .systemFont(ofSize: 15)
<<<<<<< HEAD
        //resultNumberLabel.text = "(" + String(resultNumber) + ")"
        resultNumberLabel.text = "(0)"
=======

        //resultNumberLabel.text = "(" + String(resultNumber) + ")"

        resultNumberLabel.text = "(0)"

>>>>>>> e966a77bd4b0219885b9c5cbbc92d8d8f724a78d
        resultNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultNumberLabel)
        
    }
        
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            resultLabel.widthAnchor.constraint(equalToConstant: 195),
            resultLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            resultNumberLabel.leadingAnchor.constraint(equalTo: resultLabel.trailingAnchor),
            resultNumberLabel.bottomAnchor.constraint(equalTo: resultLabel.bottomAnchor),
           resultNumberLabel.widthAnchor.constraint(equalToConstant: 30),
            resultNumberLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            searchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchTableView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            searchTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func filterForSearchText(_  searchText: String) {
        
        filteredBooks = books.filter { (book: bookData) -> Bool in
            let value: Bool = book.author.lowercased().contains(searchText.lowercased())
                || book.title.lowercased().contains(searchText.lowercased())
            return value
        // ISBN not yet added because fake data does not have ISBN attribute; when adding ISBN, just append
        // "|| book.ISBN.contains(searchText)" at the end of the let value:...
        }
        //searchTableView.reloadData()
        //reloadTableView()
    }
    
    //func reloadTableView() {
    //    let resultNumber:Int? = filteredBooks.count
    //    if let result = resultNumber {
    //        resultNumberLabel.text = "(" + String(result) + ")"
    //    } else {
    //        resultNumberLabel.text = "(0)"
    //    }
    //searchTableView.reloadData()
    //}
    
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterForSearchText(searchBar.text!)
    }
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO, will push screen containing book info
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: searchCellReuseIdentifier, for: indexPath) as! SearchTableViewCell
        cell.configure(inputbookData: filteredBooks[indexPath.item])
        return cell
    }
}
