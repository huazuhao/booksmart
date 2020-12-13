//
//  HomeScreenCollectionViewCell.swift
//  textbook
//
//  Created by Zuhao Hua on 11/27/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import Foundation
import UIKit

class HomeScreenCollectionViewCell: UICollectionViewCell{
    
    static let homeScreenCollectionViewCellIdentifier = "homeScreenCollectionViewCellIdentifier"
    
    var bookImage: UIImageView!
    var bookTitle: UILabel!
    var bookCourse: UILabel!
    var bookAuthor: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        bookImage = UIImageView()
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.contentMode = .scaleAspectFill
        bookImage.layer.cornerRadius = 20
        bookImage.clipsToBounds = true
        contentView.addSubview(bookImage)
        
        bookTitle = UILabel()
        bookTitle.isUserInteractionEnabled = false
        bookTitle.translatesAutoresizingMaskIntoConstraints = false
        bookTitle.backgroundColor = .white
        bookTitle.textColor = .black
        bookTitle.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(bookTitle)
        
        bookAuthor = UILabel()
        bookAuthor.isUserInteractionEnabled = false
        bookAuthor.translatesAutoresizingMaskIntoConstraints = false
        bookAuthor.backgroundColor = .white
        bookAuthor.textColor = .black
        bookAuthor.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(bookAuthor)
        
        bookCourse = UILabel()
        bookCourse.isUserInteractionEnabled = false
        bookCourse.translatesAutoresizingMaskIntoConstraints = false
        bookCourse.backgroundColor = .white
        bookCourse.textColor = .black
        bookCourse.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(bookCourse)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            bookImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            bookImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bookImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bookImage.heightAnchor.constraint(equalToConstant: self.frame.height*0.7)
        ])
        
        NSLayoutConstraint.activate([
            bookTitle.topAnchor.constraint(equalTo: bookImage.bottomAnchor),
            bookTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bookTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bookTitle.heightAnchor.constraint(equalToConstant: self.frame.height*0.1)
        ])
        
        NSLayoutConstraint.activate([
            bookAuthor.topAnchor.constraint(equalTo: bookTitle.bottomAnchor),
            bookAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bookAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bookAuthor.heightAnchor.constraint(equalToConstant: self.frame.height*0.1)
        ])
        
        NSLayoutConstraint.activate([
            bookCourse.topAnchor.constraint(equalTo: bookAuthor.bottomAnchor),
            bookCourse.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bookCourse.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bookCourse.heightAnchor.constraint(equalToConstant: self.frame.height*0.1)
        ])
        
    }
    
    
    func configure(inputbookData:Book){
        
        print("need to config in HomeScreenCollectionViewCell")
        
        if inputbookData.image.count == 0 {
            bookImage.image = UIImage(named: "default_book")
        }
        else{
            inputbookData.image[0].url
            print("there is an image url")
        }

        bookTitle.text = inputbookData.title
        bookAuthor.text = inputbookData.author
        bookCourse.text = inputbookData.courseName
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
