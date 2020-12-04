//
//  CartTableViewCell.swift
//  textbook
//
//  Created by Zuhao Hua on 12/3/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    var textbookImage: UIImageView!
    var textbookTitle: UILabel!
    var textbookPriceLabel: UILabel!
    let sidePadding:CGFloat = 20
    
    static let cartTableViewCellIdentifier = "cartTableViewCellIdentifier"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //the line below is for creating space between cells in UITableView
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        selectionStyle = .none
        backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
        textbookImage = UIImageView()
        textbookImage.translatesAutoresizingMaskIntoConstraints = false
        textbookImage.contentMode = .scaleToFill
        textbookImage.layer.cornerRadius = 20
        textbookImage.clipsToBounds = true
        contentView.addSubview(textbookImage)
        
        textbookTitle = UILabel()
        textbookTitle.translatesAutoresizingMaskIntoConstraints = false
        textbookTitle.font = .systemFont(ofSize: 18)
        textbookTitle.textColor = .black
        contentView.addSubview(textbookTitle)
        
        textbookPriceLabel = UILabel()
        textbookPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        textbookPriceLabel.font = .systemFont(ofSize: 18)
        textbookPriceLabel.textColor = .black
        contentView.addSubview(textbookPriceLabel)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            textbookImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            textbookImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textbookImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: sidePadding),
            textbookImage.widthAnchor.constraint(equalToConstant: contentView.frame.width*0.4)
        ])
        
        NSLayoutConstraint.activate([
            textbookTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            textbookTitle.leadingAnchor.constraint(equalTo: textbookImage.trailingAnchor, constant: contentView.frame.width*0.05),
            textbookTitle.heightAnchor.constraint(equalToConstant: 50),
            textbookTitle.widthAnchor.constraint(equalToConstant: contentView.frame.width*0.4)
        ])
        
        NSLayoutConstraint.activate([
            textbookPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textbookPriceLabel.heightAnchor.constraint(equalToConstant: 50),
            textbookPriceLabel.leadingAnchor.constraint(equalTo: textbookImage.trailingAnchor, constant: contentView.frame.width*0.05),
            textbookPriceLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width*0.4)
        ])
        
    }
    
    func configure(inputbookData:bookData){
        textbookImage.image = UIImage(named: inputbookData.bookImageName)
        textbookTitle.text = inputbookData.title
        let displayPrice: String = String(format: "%.2f", inputbookData.sellPrice)
        textbookPriceLabel.text = displayPrice
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
