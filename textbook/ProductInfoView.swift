//
//  ProductInfoView.swift
//  textbook
//
//  Created by Zuhao Hua on 12/6/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import Foundation

import UIKit

class ProductInfoView: UIView {
    
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
    var bookID:Int!

    init() {
        super.init(frame: CGRect.zero)

        backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
            
        bookTitle = UILabel()
        bookTitle.textColor = .black
        bookTitle.textAlignment = .left
        bookTitle.font = .systemFont(ofSize: 22, weight: .bold)
        // temporary placeholder, add later
        bookTitle.text = "Book Title Goes Here" //there is a config for this
        bookTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bookTitle)
            
        bookAuthor = UILabel()
        bookAuthor.textColor = .black
        bookAuthor.textAlignment = .left
        bookAuthor.font = .systemFont(ofSize: 15, weight: .regular)
        // temporary placeholder, add later
        bookAuthor.text = "Book Author Goes Here" //there is a config for this
        bookAuthor.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bookAuthor)
            
        bookEdition = UILabel()
        bookEdition.textColor = .black
        bookEdition.textAlignment = .left
        bookEdition.font = .systemFont(ofSize: 15, weight: .regular)
        // temporary placeholder, add later
        bookEdition.text = "Book Edition Goes Here"
        bookEdition.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bookEdition)
        
        bookISBN = UILabel()
        bookISBN.textColor = .black
        bookISBN.textAlignment = .left
        bookISBN.font = .systemFont(ofSize: 15, weight: .regular)
        // temporary placeholder, add later
        bookISBN.text = "Book ISBN Goes Here"
        bookISBN.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bookISBN)
            
        bookPrice = UILabel()
        bookPrice.textColor = .black
        bookPrice.textAlignment = .right
        bookPrice.font = .systemFont(ofSize: 22, weight: .bold)
        // temporary placeholder, add later
        bookPrice.text = "Price" //there is a config for this
        bookPrice.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bookPrice)
            
        bookCondition = UILabel()
        bookCondition.textColor = .black
        bookCondition.textAlignment = .right
        bookCondition.font = .systemFont(ofSize: 22, weight: .regular)
        // temporary placeholder, add later
        bookCondition.text = "Condition"
        bookCondition.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bookCondition)
        
        bookClass = UILabel()
        bookClass.textColor = .black
        bookClass.textAlignment = .left
        bookClass.font = .systemFont(ofSize: 18, weight: .regular)
        // temporary placeholder, add later
        bookClass.text = "Book Class Goes Here"
        bookClass.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bookClass)
        
        classLabel = UILabel()
        classLabel.textColor = .black
        classLabel.textAlignment = .left
        classLabel.font = .systemFont(ofSize: 18, weight: .regular)
        classLabel.text = "Used in "
        classLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(classLabel)
            
        bookImage = UIImageView()
        bookImage.layer.cornerRadius = 20
        bookImage.clipsToBounds = true
        bookImage.image = UIImage(named: "calculus_for_dummies")
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bookImage)
            
        sellerName = UILabel()
        sellerName.textColor = .black
        sellerName.textAlignment = .left
        sellerName.font = .systemFont(ofSize: 20, weight: .bold)
        // temporary placeholder, add later
        sellerName.text = "Seller Name Goes Here"
        sellerName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sellerName)
            
        sellerLabel = UILabel()
        sellerLabel.textColor = .black
        sellerLabel.textAlignment = .left
        sellerLabel.font = .systemFont(ofSize: 22, weight: .bold)
        sellerLabel.text = "About the seller "
        sellerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sellerLabel)
            
        sellerEmail = UILabel()
        sellerEmail.textColor = .lightGray
        sellerEmail.textAlignment = .left
        sellerEmail.font = .systemFont(ofSize: 15, weight: .regular)
        // temporary placeholder, add later
        sellerEmail.text = "Seller Email Goes Here"
        sellerEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sellerEmail)
            
        sellerImage = UIImageView()
        sellerImage.layer.cornerRadius = 25
        // temporary image, replace later
        sellerImage.image = UIImage(named: "introduction_to_psychology")
        sellerImage.clipsToBounds = true
        sellerImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sellerImage)
            
        addButton = UIButton()
        addButton.layer.cornerRadius = 20
        addButton.clipsToBounds = true
        addButton.setTitle("Add to Cart", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addButton)
            
    }
    
    func setupConstraints() {
        
        let padding: CGFloat = 25
            
        NSLayoutConstraint.activate([
            bookTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            bookTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bookTitle.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            bookImage.topAnchor.constraint(equalTo: bookTitle.bottomAnchor, constant: 15),
            bookImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            bookImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            bookImage.bottomAnchor.constraint(equalTo: bookAuthor.topAnchor, constant: -5)
        ])

        NSLayoutConstraint.activate([
            bookAuthor.bottomAnchor.constraint(equalTo: sellerLabel.topAnchor, constant: -80),
            bookAuthor.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            bookAuthor.widthAnchor.constraint(equalToConstant: 180),
            bookAuthor.heightAnchor.constraint(equalToConstant: 24)
        ])

        NSLayoutConstraint.activate([
            bookEdition.topAnchor.constraint(equalTo: bookAuthor.bottomAnchor),
            bookEdition.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            bookEdition.widthAnchor.constraint(equalToConstant: 180)
        ])

        NSLayoutConstraint.activate([
            bookISBN.topAnchor.constraint(equalTo: bookEdition.bottomAnchor),
            bookISBN.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            bookISBN.widthAnchor.constraint(equalToConstant: 180)
        ])

        NSLayoutConstraint.activate([
            bookPrice.topAnchor.constraint(equalTo: bookAuthor.topAnchor),
            bookPrice.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            bookPrice.widthAnchor.constraint(equalToConstant: 110)
        ])

        NSLayoutConstraint.activate([
            bookCondition.topAnchor.constraint(equalTo: bookPrice.bottomAnchor),
            bookCondition.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            bookCondition.widthAnchor.constraint(equalToConstant: 110)
        ])

        NSLayoutConstraint.activate([
            classLabel.topAnchor.constraint(equalTo: bookISBN.bottomAnchor, constant: 12),
            classLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            classLabel.widthAnchor.constraint(equalToConstant: 65)
        ])

        NSLayoutConstraint.activate([
            bookClass.topAnchor.constraint(equalTo: bookISBN.bottomAnchor, constant: 12),
            bookClass.leadingAnchor.constraint(equalTo: classLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            sellerLabel.topAnchor.constraint(equalTo: addButton.topAnchor, constant: -100),
            sellerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding)
        ])

        NSLayoutConstraint.activate([
            sellerImage.topAnchor.constraint(equalTo: sellerLabel.bottomAnchor, constant: 5),
            sellerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
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
            addButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 364),
            addButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
        
    func configure(inputBookData:Book){
        
        print("need to config")
        
        
        if inputBookData.image.count == 0 {
            bookImage.image = UIImage(named: "default_book")
        }
        else{
            inputBookData.image[0].url
            print("the book name is\(inputBookData.title)")
            print("there is an image url")
            print("the url is \(inputBookData.image[0].url)")
            
            let temp_Image_url = "https://images.theconversation.com/files/93616/original/image-20150902-6700-t2axrz.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1000&fit=clip"
            bookImage.sd_setImage(with: URL(string: temp_Image_url), placeholderImage: UIImage(named: "default_book"))
            
            //bookImage.sd_setImage(with: URL(string: inputbookData.image[0].url), placeholderImage: UIImage(named: "default_book"))
        }
        
//      bookImage.image = UIImage(named: inputBookData.image)
        bookTitle.text = inputBookData.title
        bookAuthor.text = inputBookData.author
        //bookPrice.text = String(format: "%.2f", inputBookData.price)
        bookPrice.text = inputBookData.price
        bookEdition.text = "Edition is \(inputBookData.edition)"
        bookISBN.text = inputBookData.isbn
        bookClass.text = inputBookData.courseName
        
        
        //get seller name and email
        var retrievedUserInfo: userInfoResponseDataStruct!
        
        NetworkManager.getUserInfo(currentUserId: inputBookData.sellerId){ [self] responseData in
            retrievedUserInfo = responseData
            self.sellerEmail.text = retrievedUserInfo.email
            self.sellerName.text = retrievedUserInfo.name        }
        
        bookID = inputBookData.id
    }
    
    @objc func addButtonTapped()
    {
        //TODO - put books into cart
        
        let fakeSellerID :Int = LoginViewController.currentUser.id //this is now correct
        let postStruct = addCartStruct(bookId: bookID)
        
        NetworkManager.addToCart(book: postStruct, currentUserId: fakeSellerID)
    }

}
