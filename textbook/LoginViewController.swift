//
//  LoginViewController.swift
//  textbook
//
//  Created by Jessica Wu on 12/4/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var registerEmail: UITextField!
    var registerName: UITextField!
    var registerPassword: UITextField!
    var registerTab: UIButton!
    var registerButton: UIButton!
    var loginEmail: UITextField!
    var loginPassword: UITextField!
    var loginTab: UIButton!
    var loginButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
        registerEmail = UITextField()
        let registerEmailPlaceHolder=NSAttributedString(string: "Student Email", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        registerEmail.textColor = .gray
        registerEmail.attributedPlaceholder = registerEmailPlaceHolder
        registerEmail.layer.borderColor = UIColor.black.cgColor
        registerEmail.layer.backgroundColor = UIColor.white.cgColor
        registerEmail.layer.borderWidth = 0.0
        registerEmail.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        registerEmail.layer.shadowOpacity = 1.0
        registerEmail.layer.shadowRadius = 0.0
        registerEmail.isHidden = true
        registerEmail.isUserInteractionEnabled = false
        registerEmail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerEmail)
        
        registerName = UITextField()
        let registerNamePlaceHolder=NSAttributedString(string: "Name", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        registerName.textColor = .gray
        registerName.attributedPlaceholder = registerNamePlaceHolder
        registerName.layer.borderColor = UIColor.black.cgColor
        registerName.layer.backgroundColor = UIColor.white.cgColor
        registerName.layer.borderWidth = 0.0
        registerName.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        registerName.layer.shadowOpacity = 1.0
        registerName.layer.shadowRadius = 0.0
        registerName.isHidden = true
        registerName.isUserInteractionEnabled = false
        registerName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerName)
        
        registerPassword = UITextField()
        let registerPasswordPlaceHolder=NSAttributedString(string: "Password", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        registerPassword.textColor = .gray
        registerPassword.attributedPlaceholder = registerPasswordPlaceHolder
        registerPassword.layer.borderColor = UIColor.black.cgColor
        registerPassword.layer.backgroundColor = UIColor.white.cgColor
        registerPassword.layer.borderWidth = 0.0
        registerPassword.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        registerPassword.layer.shadowOpacity = 1.0
        registerPassword.layer.shadowRadius = 0.0
        registerEmail.isHidden = true
        registerEmail.isUserInteractionEnabled = false
        registerPassword.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerPassword)
        
        loginEmail = UITextField()
        let loginEmailPlaceHolder=NSAttributedString(string: "Student Email", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        loginEmail.textColor = .gray
        loginEmail.attributedPlaceholder = loginEmailPlaceHolder
        loginEmail.layer.borderColor = UIColor.black.cgColor
        loginEmail.layer.backgroundColor = UIColor.white.cgColor
        loginEmail.layer.borderWidth = 0.0
        loginEmail.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        loginEmail.layer.shadowOpacity = 1.0
        loginEmail.layer.shadowRadius = 0.0
        loginEmail.isHidden = false
        loginEmail.isUserInteractionEnabled = true
        loginEmail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginEmail)
        
        loginPassword = UITextField()
        let loginPasswordPlaceHolder=NSAttributedString(string: "Password", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        loginPassword.textColor = .gray
        loginPassword.attributedPlaceholder = loginPasswordPlaceHolder
        loginPassword.layer.borderColor = UIColor.black.cgColor
        loginPassword.layer.backgroundColor = UIColor.white.cgColor
        loginPassword.layer.borderWidth = 0.0
        loginPassword.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        loginPassword.layer.shadowOpacity = 1.0
        loginPassword.layer.shadowRadius = 0.0
        loginPassword.isHidden = false
        loginPassword.isUserInteractionEnabled = true
        loginPassword.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginPassword)
        
        registerTab = UIButton()
        registerTab.layer.cornerRadius = 20
        registerTab.clipsToBounds = true
        registerTab.setTitle("Sign Up", for: .normal)
        registerTab.setTitleColor(.black, for: .normal)
        registerTab.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        registerTab.addTarget(self, action: #selector(registerTabTapped), for: .touchUpInside)
        registerTab.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerTab)
        
        loginTab = UIButton()
        loginTab.layer.cornerRadius = 20
        loginTab.clipsToBounds = true
        loginTab.setTitle("Sign In", for: .normal)
        loginTab.setTitleColor(.white, for: .normal)
        loginTab.backgroundColor = .blue
        loginTab.addTarget(self, action: #selector(loginTabTapped), for: .touchUpInside)
        loginTab.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTab)
        
        registerButton = UIButton()
        registerButton.layer.cornerRadius = 20
        registerButton.clipsToBounds = true
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        registerButton.isHidden = true
        registerButton.isUserInteractionEnabled = false
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerButton)
        
        loginButton = UIButton()
        loginButton.layer.cornerRadius = 20
        loginButton.clipsToBounds = true
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.isHidden = false
        loginButton.isUserInteractionEnabled = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
    }
    
    func setupConstraints() {
        
        let padding: CGFloat = 50
        
        NSLayoutConstraint.activate([
            loginTab.bottomAnchor.constraint(equalTo: loginEmail.topAnchor, constant: -150),
            loginTab.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            loginTab.widthAnchor.constraint(equalToConstant: 120),
            loginTab.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            registerTab.topAnchor.constraint(equalTo: loginTab.topAnchor),
            registerTab.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            registerTab.widthAnchor.constraint(equalToConstant: 120),
            registerTab.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            registerName.bottomAnchor.constraint(equalTo: registerEmail.topAnchor, constant: -40),
            registerName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            registerName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            registerEmail.bottomAnchor.constraint(equalTo: registerPassword.topAnchor, constant: -40),
            registerEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            registerEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            registerPassword.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -60),
            registerPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            registerPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 140),
            registerButton.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        NSLayoutConstraint.activate([
            loginEmail.bottomAnchor.constraint(equalTo: loginPassword.topAnchor, constant: -40),
            loginEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            loginEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            loginPassword.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -60),
            loginPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            loginPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 140),
            loginButton.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
    
    @ objc func loginTabTapped() {
        if loginTab.backgroundColor == UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1) {
            registerName.isHidden = true
            registerName.isUserInteractionEnabled = false
            registerEmail.isHidden = true
            registerEmail.isUserInteractionEnabled = false
            registerPassword.isHidden = true
            registerPassword.isUserInteractionEnabled = false
            registerButton.isHidden = true
            registerButton.isUserInteractionEnabled = false
            
            loginEmail.isHidden = false
            loginEmail.isUserInteractionEnabled = true
            loginPassword.isHidden = false
            loginPassword.isUserInteractionEnabled = true
            loginButton.isHidden = false
            loginButton.isUserInteractionEnabled = true
            
            loginTab.backgroundColor = .blue
            loginTab.setTitleColor(.white, for: .normal)
            registerTab.setTitleColor(.black, for: .normal)
            registerTab.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        }
    }
    
    @objc func registerTabTapped() {
        if registerTab.backgroundColor == UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1) {
            loginEmail.isHidden = true
            loginEmail.isUserInteractionEnabled = false
            loginPassword.isHidden = true
            loginPassword.isUserInteractionEnabled = false
            loginButton.isHidden = true
            loginButton.isUserInteractionEnabled = false
            
            registerName.isHidden = false
            registerName.isUserInteractionEnabled = true
            registerEmail.isHidden = false
            registerEmail.isUserInteractionEnabled = true
            registerPassword.isHidden = false
            registerPassword.isUserInteractionEnabled = true
            registerButton.isHidden = false
            registerButton.isUserInteractionEnabled = true
            
            registerTab.backgroundColor = .blue
            registerTab.setTitleColor(.white, for: .normal)
            loginTab.setTitleColor(.black, for: .normal)
            loginTab.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        }
    }
    
    @objc func registerButtonTapped() {
        // implement registration later
    }
    
    @ objc func loginButtonTapped() {
        // implement login later, for now it pushes the main page onto navigation controller
        navigationController?.pushViewController(TabBarController(), animated: true)
    }

}
