//
//  HomeScreenCollectionView.swift
//  textbook
//
//  Created by Zuhao Hua on 11/27/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import Foundation

import UIKit

class HomeScreenCollectionView: UICollectionView{
    
    let padding:CGFloat = 20
    static let homeScreenCollectionViewIdentifier = "homeScreenCollectionViewIdentifier"
    
    init(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = padding
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        //make sure the UICollectionView doesn't start at the edge
        self.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.register(HomeScreenCollectionViewCell.self, forCellWithReuseIdentifier: HomeScreenCollectionViewCell.homeScreenCollectionViewCellIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
