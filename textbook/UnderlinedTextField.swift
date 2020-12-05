//
//  UnderlinedTextField.swift
//  textbook
//
//  Created by Zuhao Hua on 12/3/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import Foundation
import UIKit

class UnderlinedTextField: UITextField {
    private let defaultUnderlineColor = UIColor.black
    private let bottomLine = UIView()

    override func awakeFromNib() {
        super.awakeFromNib()

        borderStyle = .none
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = defaultUnderlineColor

        self.addSubview(bottomLine)
        bottomLine.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 1).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    public func setUnderlineColor(color: UIColor = .red) {
        bottomLine.backgroundColor = color
    }

    public func setDefaultUnderlineColor() {
        bottomLine.backgroundColor = defaultUnderlineColor
    }
}
