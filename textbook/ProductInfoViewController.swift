//
//  ProductInfoViewController.swift
//  textbook
//
//  Created by Jessica Wu on 12/4/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import UIKit

class ProductInfoViewController: UIViewController {
    
    var bookTitle: UILabel!
    var bookAuthor: UILabel!
    var bookEdition: UILabel!
    var bookISBN: UILabel!
    var bookPrice: UILabel!
    var bookCondition: UILabel!
    var bookClass: UILabel!
    var classLabel: UILabel!
    var bookImage: UIImageView!
    var sellerLabel: UILabel!
    var sellerName: UILabel!
    var sellerEmail: UILabel!
    var sellerImage: UIImageView!
    var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        setupViews()
        setupConstraints()
    }

    func setupViews() {
        
        bookTitle = UILabel()
        bookTitle.textColor = .black
        bookTitle.textAlignment = .left
        bookTitle.font = .systemFont(ofSize: 22, weight: .bold)
        // temporary placeholder, add later
        bookTitle.text = "Book Title Goes Here"
        bookTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookTitle)
        
        bookAuthor = UILabel()
        bookAuthor.textColor = .black
        bookAuthor.textAlignment = .left
        bookAuthor.font = .systemFont(ofSize: 15, weight: .regular)
        // temporary placeholder, add later
        bookAuthor.text = "Book Author Goes Here"
        bookAuthor.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookAuthor)
        
        bookEdition = UILabel()
        bookEdition.textColor = .black
        bookEdition.textAlignment = .left
        bookEdition.font = .systemFont(ofSize: 15, weight: .regular)
        // temporary placeholder, add later
        bookEdition.text = "Book Edition Goes Here"
        bookEdition.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookEdition)
        
        bookISBN = UILabel()
        bookISBN.textColor = .black
        bookISBN.textAlignment = .left
        bookISBN.font = .systemFont(ofSize: 15, weight: .regular)
        // temporary placeholder, add later
        bookISBN.text = "Book ISBN Goes Here"
        bookISBN.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookISBN)
        
        bookPrice = UILabel()
        bookPrice.textColor = .black
        bookPrice.textAlignment = .right
        bookPrice.font = .systemFont(ofSize: 22, weight: .bold)
        // temporary placeholder, add later
        bookPrice.text = "Price"
        bookPrice.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookPrice)
        
        bookCondition = UILabel()
        bookCondition.textColor = .black
        bookCondition.textAlignment = .right
        bookCondition.font = .systemFont(ofSize: 22, weight: .regular)
        // temporary placeholder, add later
        bookCondition.text = "Condition"
        bookCondition.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookCondition)
        
        bookClass = UILabel()
        bookClass.textColor = .black
        bookClass.textAlignment = .left
        bookClass.font = .systemFont(ofSize: 18, weight: .regular)
        // temporary placeholder, add later
        bookClass.text = "Book Class Goes Here"
        bookClass.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookClass)
        
        classLabel = UILabel()
        classLabel.textColor = .black
        classLabel.textAlignment = .left
        classLabel.font = .systemFont(ofSize: 18, weight: .regular)
        classLabel.text = "Used in "
        classLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(classLabel)
        
        bookImage = UIImageView()
        bookImage.layer.cornerRadius = 20
        bookImage.clipsToBounds = true
        bookImage.image = UIImage(named: "calculus_for_dummies")
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookImage)
        
        sellerName = UILabel()
        sellerName.textColor = .black
        sellerName.textAlignment = .left
        sellerName.font = .systemFont(ofSize: 20, weight: .bold)
        // temporary placeholder, add later
        sellerName.text = "Seller Name Goes Here"
        sellerName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sellerName)
        
        sellerLabel = UILabel()
        sellerLabel.textColor = .black
        sellerLabel.textAlignment = .left
        sellerLabel.font = .systemFont(ofSize: 22, weight: .bold)
        sellerLabel.text = "About the seller "
        sellerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sellerLabel)
        
        sellerEmail = UILabel()
        sellerEmail.textColor = .lightGray
        sellerEmail.textAlignment = .left
        sellerEmail.font = .systemFont(ofSize: 15, weight: .regular)
        // temporary placeholder, add later
        sellerEmail.text = "Seller Email Goes Here"
        sellerEmail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sellerEmail)
        
        sellerImage = UIImageView()
        sellerImage.layer.cornerRadius = 25
        // temporary image, replace later
        sellerImage.image = UIImage(named: "introduction_to_psychology")
        sellerImage.clipsToBounds = true
        sellerImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sellerImage)
        
        addButton = UIButton()
        addButton.layer.cornerRadius = 20
        addButton.clipsToBounds = true
        addButton.setTitle("Add to Cart", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        
    }
    
    func setupConstraints() {
        
        let padding: CGFloat = 25
        
        NSLayoutConstraint.activate([
            bookTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            bookTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bookImage.topAnchor.constraint(equalTo: bookTitle.bottomAnchor, constant: 25),
            bookImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bookImage.widthAnchor.constraint(equalToConstant: 380),
            bookImage.heightAnchor.constraint(equalToConstant: 375)
        ])
        
        NSLayoutConstraint.activate([
            bookAuthor.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 20),
            bookAuthor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            bookAuthor.widthAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            bookEdition.topAnchor.constraint(equalTo: bookAuthor.bottomAnchor),
            bookEdition.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            bookEdition.widthAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            bookISBN.topAnchor.constraint(equalTo: bookEdition.bottomAnchor),
            bookISBN.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            bookISBN.widthAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            bookPrice.topAnchor.constraint(equalTo: bookAuthor.topAnchor),
            bookPrice.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bookPrice.widthAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            bookCondition.topAnchor.constraint(equalTo: bookPrice.bottomAnchor),
            bookCondition.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bookCondition.widthAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            classLabel.topAnchor.constraint(equalTo: bookISBN.bottomAnchor, constant: 12),
            classLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            classLabel.widthAnchor.constraint(equalToConstant: 65)
        ])
        
        NSLayoutConstraint.activate([
            bookClass.topAnchor.constraint(equalTo: bookISBN.bottomAnchor, constant: 12),
            bookClass.leadingAnchor.constraint(equalTo: classLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            sellerLabel.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: 14),
            sellerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            sellerImage.topAnchor.constraint(equalTo: sellerLabel.bottomAnchor, constant: 19),
            sellerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            sellerImage.widthAnchor.constraint(equalToConstant: 50),
            sellerImage.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            sellerName.topAnchor.constraint(equalTo: sellerImage.topAnchor),
            sellerName.leadingAnchor.constraint(equalTo: sellerImage.trailingAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            sellerEmail.topAnchor.constraint(equalTo: sellerName.bottomAnchor),
            sellerEmail.leadingAnchor.constraint(equalTo: sellerName.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 364),
            addButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc func addButtonTapped()
    {
        //TODO - put books into cart 
    }

}
