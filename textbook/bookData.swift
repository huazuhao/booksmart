//
//  bookData.swift
//  textbook
//
//  Created by Zuhao Hua on 11/27/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import Foundation

enum SellType{
    case sell
    case exchange
}


class bookData {
    
    var bookImageName : String
    var title: String
    var author: String
    var courseName: String
    var sellType: SellType
    var sellPrice: Double
    
    init(imageName:String,inputTitle:String,inputAuthor:String,inputCourseName:String,inputSellType:SellType,inputSellPrice:Double) {
        bookImageName = imageName
        title = inputTitle
        author = inputAuthor
        courseName = inputCourseName
        sellType = inputSellType
        sellPrice = inputSellPrice
    }
    
    
}


struct RecentlyAdded: Codable{
    
    var success: Bool
    var data:[Book]
}


struct Book: Codable{
    
    var id: Int
    var image: String
    var title: String
    var author: String
    var courseName: String
    var isbn: String
    var edition: String
    var price: String
    var available: Bool
    var createdAt: String
    var updatedAt: String?
    var sellerId: Int
    
}
