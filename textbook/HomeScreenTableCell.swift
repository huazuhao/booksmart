//
//  HomeScreenTableCell.swift
//  textbook
//
//  Created by Zuhao Hua on 11/27/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import Foundation
import UIKit


protocol ShowProductInfoProtocol: class {
    func showProductInfoProtocol(inputBook:Book)
}

class HomeScreenTableCell: UITableViewCell{
    
    static let homeScreenTableCellIdentifier = "homeScreenTableCellIdentifier"
    
    var cellTitle: UILabel!
    var embedCollectionView: UICollectionView!
    var currentTableData : [Book]!
    
    let cellTitlePadding:CGFloat = 20
    let cellTitleHeight:CGFloat = 40
    let embedCollectionViewTopPadding:CGFloat = 5
    let embedCollectionViewBottomPadding:CGFloat = 10
    
    weak var newScreenDelegate: ShowProductInfoProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        cellTitle = UILabel()
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.font = .boldSystemFont(ofSize: 28)
        contentView.addSubview(cellTitle)
        
        embedCollectionView = HomeScreenCollectionView()
        embedCollectionView.dataSource = self
        embedCollectionView.delegate = self
        embedCollectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(embedCollectionView)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            cellTitle.topAnchor.constraint(equalTo: self.topAnchor),
            cellTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: cellTitlePadding),
            cellTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cellTitle.heightAnchor.constraint(equalToConstant: cellTitleHeight)
        ])
        
        NSLayoutConstraint.activate([
            embedCollectionView.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: embedCollectionViewTopPadding),
            embedCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            embedCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            embedCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -embedCollectionViewBottomPadding)
        ])
        
    }
    
    func configure(rowName:String,rowData:[Book]){
        //This configure function is used for configuring a row in the UITableView
        cellTitle.text = rowName
        currentTableData = rowData
        embedCollectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension HomeScreenTableCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        currentTableData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeScreenCollectionViewCell.homeScreenCollectionViewCellIdentifier, for: indexPath) as! HomeScreenCollectionViewCell
        cell.configure(inputbookData: currentTableData[indexPath.item])
        return cell
        
    }
    
    
}

extension HomeScreenTableCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthSize = (self.frame.width) / 3
        let heightSize = self.frame.height-cellTitleHeight-embedCollectionViewTopPadding-embedCollectionViewBottomPadding

        return CGSize(width: widthSize, height: heightSize)
        
    }
}

extension HomeScreenTableCell:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        newScreenDelegate?.showProductInfoProtocol(inputBook: currentTableData[indexPath.item])
    }
}
