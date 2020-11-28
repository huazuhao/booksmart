//
//  bookData.swift
//  textbook
//
//  Created by Zuhao Hua on 11/27/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import Foundation

class bookData {
    
    var bookImageName : String
    var title: String
    var author: String
    var courseName: String
    
    init(imageName:String,inputTitle:String,inputAuthor:String,inputCourseName:String) {
        bookImageName = imageName
        title = inputTitle
        author = inputAuthor
        courseName = inputCourseName
    }
    
    
}
