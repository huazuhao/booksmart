//
//  BottomBorderTF.swift
//  textbook
//
//  Created by Zuhao Hua on 12/3/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import Foundation
import UIKit

class BottomBorderTF: UITextField {

var bottomBorder = UIView()
override func awakeFromNib() {

    //MARK: Setup Bottom-Border
    self.translatesAutoresizingMaskIntoConstraints = false
    bottomBorder = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    bottomBorder.backgroundColor = UIColor.orange
    bottomBorder.translatesAutoresizingMaskIntoConstraints = false
    addSubview(bottomBorder)
    //Mark: Setup Anchors
    bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    bottomBorder.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    bottomBorder.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    bottomBorder.heightAnchor.constraint(equalToConstant: 10).isActive = true // Set Border-Strength

   }
}
