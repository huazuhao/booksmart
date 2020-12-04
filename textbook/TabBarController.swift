//
//  TabBarController.swift
//  textbook
//
//  Created by Zuhao Hua on 11/29/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import Foundation

import UIKit

class TabBarController: UITabBarController {
    
    // hide the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        let appearance = UITabBarItem.appearance()
        let attributes: [NSAttributedString.Key: AnyObject] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue):UIFont(name: "American Typewriter", size: 12)!]
        appearance.setTitleTextAttributes(attributes, for: .normal)
        
        //homescreen
        let newHomeIconImage = Util.resizeImage(image: UIImage(named: "home_icon")!, targetSize: CGSize(width: 28, height: 28))
        let home = generateNavController(vc: HomeScreenController(), barTitle: "Home", pageTitle: "Home", image: newHomeIconImage)
        
        //sell new book
        let newAddIcon = Util.resizeImage(image: UIImage(named: "add_icon")!, targetSize: CGSize(width: 28, height: 28))
        let addNewBook = generateNavController(vc: AddNewBook(), barTitle: "Sell", pageTitle: "Sell A New Book", image: newAddIcon)
        
        //cart
        let newCartIcon = Util.resizeImage(image: UIImage(named: "cart_icon")!, targetSize: CGSize(width: 28, height: 28))
        let cart = generateNavController(vc: CartViewController(), barTitle: "Cart", pageTitle: "My Shopping Cart", image: newCartIcon)

        viewControllers = [home,addNewBook,cart]

    }
    
    func generateNavController(vc:UIViewController,barTitle:String,pageTitle: String,image:UIImage)->UINavigationController{
        vc.navigationItem.title = pageTitle
        //vc.view.backgroundColor = .white
        let navController = UINavigationController(rootViewController: vc)
        navController.title = barTitle
        navController.tabBarItem.image = image
        
        return navController
    }

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
