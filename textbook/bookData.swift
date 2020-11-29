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
    
    init(imageName:String,inputTitle:String,inputAuthor:String,inputCourseName:String,inputSellType:SellType) {
        bookImageName = imageName
        title = inputTitle
        author = inputAuthor
        courseName = inputCourseName
        sellType = inputSellType
    }
    
    
}
