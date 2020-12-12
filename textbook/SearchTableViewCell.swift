//
//  SearchTableViewCell.swift
//  textbook
//
//  Created by Jessica Wu on 12/11/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    var bookTitle: UILabel!
    var bookPrice: UILabel!
    var bookAuthors: UILabel!
    var bookEdition: UILabel!
    var bookISBN: UILabel!
    var bookImage: UIImageView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        bookTitle = UILabel()
        bookTitle.textColor = .black
        bookTitle.font = .boldSystemFont(ofSize: 20)
        bookTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bookTitle)
        
        bookPrice = UILabel()
        bookPrice.textColor = .black
        bookPrice.font = .boldSystemFont(ofSize: 18)
        bookPrice.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bookPrice)
        
        bookAuthors = UILabel()
        bookAuthors.textColor = .black
        bookAuthors.font = .systemFont(ofSize: 18)
        bookAuthors.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bookAuthors)
        
        bookEdition = UILabel()
        bookEdition.textColor = .black
        bookEdition.font = .systemFont(ofSize: 18)
        bookEdition.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bookEdition)
        
        bookISBN = UILabel()
        bookISBN.textColor = .black
        bookISBN.font = .systemFont(ofSize: 18)
        bookISBN.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bookISBN)
        
        bookImage = UIImageView()
        bookImage.contentMode = .scaleAspectFit
        bookImage.layer.cornerRadius = 7
        bookImage.clipsToBounds = true
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bookImage)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        let sidePadding: CGFloat = 25
        let vertPadding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            bookImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: vertPadding),
            bookImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -vertPadding),
            bookImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: sidePadding),
            bookImage.widthAnchor.constraint(equalToConstant: contentView.frame.width*0.35)
        ])
        
        NSLayoutConstraint.activate([
            bookTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: vertPadding),
            bookTitle.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor,constant: sidePadding),
            bookTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bookPrice.topAnchor.constraint(equalTo: bookTitle.bottomAnchor),
            bookPrice.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor,constant: sidePadding),
            bookPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bookAuthors.topAnchor.constraint(equalTo: bookPrice.bottomAnchor),
            bookAuthors.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor,constant: sidePadding),
            bookAuthors.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bookEdition.topAnchor.constraint(equalTo: bookAuthors.bottomAnchor),
            bookEdition.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor,constant: sidePadding),
            bookEdition.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bookISBN.topAnchor.constraint(equalTo: bookEdition.bottomAnchor),
            bookISBN.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor,constant: sidePadding),
            bookISBN.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
    
    func configure(inputbookData:bookData) {
        bookImage.image = UIImage(named: inputbookData.bookImageName)
        bookTitle.text = inputbookData.title
        let displayPrice: String = String(format: "%.2f", inputbookData.sellPrice)
        bookPrice.text = "$" + displayPrice
        bookAuthors.text = inputbookData.author
        bookEdition.text = "Edition Placeholder"
        bookISBN.text = "ISBN Placeholder"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
