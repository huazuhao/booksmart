//
//  ProductInfoViewController.swift
//  textbook
//
//  Created by Zuhao Hua on 12/6/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import UIKit



class ProductInfoViewController: UIViewController {

    private let productInfoView = ProductInfoView()

    init(inputBook:Book){
        super.init(nibName: nil, bundle: nil)
        
        productInfoView.configure(inputBookData: inputBook)

        view = productInfoView
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
