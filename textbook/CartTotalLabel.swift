//
//  CartTotalLabel.swift
//  textbook
//
//  Created by Zuhao Hua on 12/5/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//
import Foundation
import UIKit

class LeftLabel: UILabel{
    // we are subclassing the UILabel class to generate some custom
    // visual effect
    
    
    override func drawText(in rect: CGRect) {
        //put some margin around the text on UILabel
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)))
    }
}

class RightLabel: UILabel{
    // we are subclassing the UILabel class to generate some custom
    // visual effect
    
    
    override func drawText(in rect: CGRect) {
        //put some margin around the text on UILabel
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)))
    }
}
