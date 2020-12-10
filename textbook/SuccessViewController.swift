//
//  SuccessViewController.swift
//  
//
//  Created by Jessica Wu on 12/9/20.
//

import UIKit
import SAConfettiView

class SuccessViewController: UIViewController {
    
    let yellow: CGColor = UIColor(red: 1, green: 0.937, blue: 0.842, alpha: 1).cgColor
    let black: UIColor = UIColor(red: 0.171, green: 0.171, blue: 0.171, alpha: 1)
    let pink: UIColor = UIColor(red: 1, green: 0.479, blue: 0.479, alpha: 1)
    
    var successTitle: UILabel!
    var successMessage: UITextView!
    var homeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.backgroundColor = yellow
        
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        
        let confettiView = SAConfettiView(frame: self.view.bounds)
        confettiView.type = .Diamond
        view.addSubview(confettiView)
        confettiView.startConfetti()
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
        successTitle = UILabel()
        successTitle.text = "One Step Closer to Success!"
        successTitle.textColor = black
        successTitle.font = UIFont.boldSystemFont(ofSize: 28)
        successTitle.textAlignment = .center
        successTitle.isUserInteractionEnabled = false
        successTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(successTitle)
        
        successMessage = UITextView()
        successMessage.text = "Your order has gone through. Be sure to\n contact your seller about the pickup\n location and date."
        successMessage.textColor = black
        successMessage.font = .systemFont(ofSize: 15)
        successMessage.textAlignment = .center
        successMessage.layer.backgroundColor = yellow
        successMessage.isUserInteractionEnabled = false
        successMessage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(successMessage)
        
        homeButton = UIButton()
        homeButton.layer.cornerRadius = 20
        homeButton.clipsToBounds = true
        homeButton.setTitle("Return to Home", for: .normal)
        homeButton.setTitleColor(.white, for: .normal)
        homeButton.backgroundColor = pink
        homeButton.isUserInteractionEnabled = true
        homeButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeButton)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            successTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            successTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            successMessage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            successMessage.topAnchor.constraint(equalTo: successTitle.bottomAnchor, constant: 24),
            successMessage.widthAnchor.constraint(equalToConstant: 290),
            successMessage.heightAnchor.constraint(equalToConstant: 75)
        ])
        
        NSLayoutConstraint.activate([
            homeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45),
            homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeButton.widthAnchor.constraint(equalToConstant: 365),
            homeButton.heightAnchor.constraint(equalToConstant: 62)
        ])
    }
    
    @objc func homeButtonTapped() {
        navigationController?.pushViewController(TabBarController(), animated: true)
    }

}
