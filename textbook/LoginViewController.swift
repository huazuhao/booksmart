//
//  LoginViewController.swift
//  textbook
//
//  Created by Jessica Wu on 12/4/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let yellow: CGColor = UIColor(red: 1, green: 0.937, blue: 0.842, alpha: 1).cgColor
    let aqua: UIColor = UIColor(red: 0.168, green: 0.543, blue: 0.567, alpha: 1)
    let gray: CGColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1).cgColor
    let grayText: UIColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1)
    let pink: UIColor = UIColor(red: 1, green: 0.479, blue: 0.479, alpha: 1)
    
    var registerTitle: UILabel!
    var registerFName: UITextField!
    var registerLName: UITextField!
    var registerEmail: UITextField!
    var registerPassword: UITextField!
    var registerLabel: UILabel!
    var registerTab: UIButton!
    var registerButton: UIButton!
    
    var loginTitle: UILabel!
    var loginEmail: UITextField!
    var loginPassword: UITextField!
    var loginLabel: UILabel!
    var loginTab: UIButton!
    var loginButton: UIButton!
    
    static var currentUser: User!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        setupBackground()
        setupViews()
        setupConstraints()
    }
    
    func setupBackground() {
        let background = UIImage(named: "yellow_background")
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.image = background
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func setupViews() {
        
        // Title
        
        registerTitle = UILabel()
        registerTitle.text = "Create Account"
        registerTitle.textColor = aqua
        registerTitle.font = UIFont.boldSystemFont(ofSize: 28)
        registerTitle.isHidden = true
        registerTitle.isUserInteractionEnabled = false
        registerTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerTitle)
        
        loginTitle = UILabel()
        loginTitle.text = "Welcome Back"
        loginTitle.textColor = aqua
        loginTitle.font = UIFont.boldSystemFont(ofSize: 28)
        loginTitle.isHidden = false
        loginTitle.isUserInteractionEnabled = false
        loginTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTitle)
        
        // User Input (everything backend needs is here)
        
        registerFName = UITextField()
        let registerFNamePlaceHolder=NSAttributedString(string: "First Name", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        registerFName.textColor = grayText
        registerFName.attributedPlaceholder = registerFNamePlaceHolder
        registerFName.layer.borderColor = gray
        registerFName.layer.backgroundColor = yellow
        registerFName.layer.borderWidth = 0.0
        registerFName.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        registerFName.layer.shadowOpacity = 1.0
        registerFName.layer.shadowRadius = 0.0
        registerFName.isHidden = true
        registerFName.isUserInteractionEnabled = false
        registerFName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerFName)
        
        registerLName = UITextField()
        let registerLNamePlaceHolder=NSAttributedString(string: "Last Name", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        registerLName.textColor = grayText
        registerLName.attributedPlaceholder = registerLNamePlaceHolder
        registerLName.layer.borderColor = gray
        registerLName.layer.backgroundColor = yellow
        registerLName.layer.borderWidth = 0.0
        registerLName.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        registerLName.layer.shadowOpacity = 1.0
        registerLName.layer.shadowRadius = 0.0
        registerLName.isHidden = true
        registerLName.isUserInteractionEnabled = false
        registerLName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerLName)
        
        registerEmail = UITextField()
        let registerEmailPlaceHolder=NSAttributedString(string: "Student Email", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        registerEmail.textColor = grayText
        registerEmail.attributedPlaceholder = registerEmailPlaceHolder
        registerEmail.layer.borderColor = gray
        registerEmail.layer.backgroundColor = yellow
        registerEmail.layer.borderWidth = 0.0
        registerEmail.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        registerEmail.layer.shadowOpacity = 1.0
        registerEmail.layer.shadowRadius = 0.0
        registerEmail.isHidden = true
        registerEmail.isUserInteractionEnabled = false
        registerEmail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerEmail)
        
        loginEmail = UITextField()
        let loginEmailPlaceHolder=NSAttributedString(string: "Student Email", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        loginEmail.textColor = grayText
        loginEmail.attributedPlaceholder = loginEmailPlaceHolder
        loginEmail.layer.borderColor = gray
        loginEmail.layer.backgroundColor = yellow
        loginEmail.layer.borderWidth = 0.0
        loginEmail.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        loginEmail.layer.shadowOpacity = 1.0
        loginEmail.layer.shadowRadius = 0.0
        loginEmail.isHidden = false
        loginEmail.isUserInteractionEnabled = true
        loginEmail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginEmail)
        
        registerPassword = UITextField()
        let registerPasswordPlaceHolder=NSAttributedString(string: "Password", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        registerPassword.textColor = grayText
        registerPassword.attributedPlaceholder = registerPasswordPlaceHolder
        registerPassword.layer.borderColor = gray
        registerPassword.layer.backgroundColor = yellow
        registerPassword.layer.borderWidth = 0.0
        registerPassword.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        registerPassword.layer.shadowOpacity = 1.0
        registerPassword.layer.shadowRadius = 0.0
        registerPassword.isHidden = true
        registerPassword.isUserInteractionEnabled = false
        registerPassword.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerPassword)
        
        loginPassword = UITextField()
        let loginPasswordPlaceHolder=NSAttributedString(string: "Password", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        loginPassword.textColor = grayText
        loginPassword.attributedPlaceholder = loginPasswordPlaceHolder
        loginPassword.layer.borderColor = gray
        loginPassword.layer.backgroundColor = yellow
        loginPassword.layer.borderWidth = 0.0
        loginPassword.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        loginPassword.layer.shadowOpacity = 1.0
        loginPassword.layer.shadowRadius = 0.0
        loginPassword.isHidden = false
        loginPassword.isUserInteractionEnabled = true
        loginPassword.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginPassword)
        
        // Question Labels
        
        registerLabel = UILabel()
        registerLabel.text = "Have an account? "
        registerLabel.textColor = grayText
        registerLabel.font = .systemFont(ofSize: 15)
        registerLabel.isHidden = true
        registerLabel.isUserInteractionEnabled = false
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerLabel)
        
        loginLabel = UILabel()
        loginLabel.text = "Don't have an account? "
        loginLabel.textColor = grayText
        loginLabel.font = .systemFont(ofSize: 15)
        loginLabel.isHidden = false
        loginLabel.isUserInteractionEnabled = false
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginLabel)
        
        // Tabs
        
        registerTab = UIButton()
        registerTab.layer.cornerRadius = 20
        registerTab.clipsToBounds = true
        registerTab.setTitle("Sign Up", for: .normal)
        registerTab.setTitleColor(aqua, for: .normal)
        registerTab.backgroundColor = UIColor(red: 1, green: 0.937, blue: 0.842, alpha: 1)
        registerTab.addTarget(self, action: #selector(registerTabTapped), for: .touchUpInside)
        registerTab.isHidden = false
        registerTab.isUserInteractionEnabled = true
        registerTab.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerTab)
        
        loginTab = UIButton()
        loginTab.layer.cornerRadius = 20
        loginTab.clipsToBounds = true
        loginTab.setTitle("Sign In", for: .normal)
        loginTab.setTitleColor(aqua, for: .normal)
        loginTab.backgroundColor = UIColor(red: 1, green: 0.937, blue: 0.842, alpha: 1)
        loginTab.addTarget(self, action: #selector(loginTabTapped), for: .touchUpInside)
        loginTab.isHidden = true
        loginTab.isUserInteractionEnabled = false
        loginTab.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTab)
        
        // Buttons
        
        registerButton = UIButton()
        registerButton.layer.cornerRadius = 20
        registerButton.clipsToBounds = true
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.backgroundColor = pink
        registerButton.isHidden = true
        registerButton.isUserInteractionEnabled = false
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerButton)
        
        loginButton = UIButton()
        loginButton.layer.cornerRadius = 20
        loginButton.clipsToBounds = true
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = pink
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.isHidden = false
        loginButton.isUserInteractionEnabled = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
    }
    
    func setupConstraints() {
        
        let padding: CGFloat = 50
        
        NSLayoutConstraint.activate([
            registerTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            registerTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            registerTitle.widthAnchor.constraint(equalToConstant: 229),
            registerTitle.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            loginTitle.leadingAnchor.constraint(equalTo: registerTitle.leadingAnchor),
            loginTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginTitle.widthAnchor.constraint(equalToConstant: 190),
            loginTitle.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            registerFName.topAnchor.constraint(equalTo: registerTitle.bottomAnchor, constant: 47),
            registerFName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            registerFName.widthAnchor.constraint(equalToConstant: 143)
        ])
        
        NSLayoutConstraint.activate([
            registerLName.topAnchor.constraint(equalTo: registerFName.topAnchor),
            registerLName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            registerLName.widthAnchor.constraint(equalToConstant: 143)
        ])
        
        NSLayoutConstraint.activate([
            registerEmail.topAnchor.constraint(equalTo: registerFName.bottomAnchor, constant: 27),
            registerEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            registerEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            registerPassword.topAnchor.constraint(equalTo: registerEmail.bottomAnchor, constant: 26),
            registerPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            registerPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: registerPassword.bottomAnchor, constant: 26),
            registerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 107),
            registerLabel.widthAnchor.constraint(equalToConstant: 128),
            registerLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            loginTab.topAnchor.constraint(equalTo: registerLabel.topAnchor),
            loginTab.leadingAnchor.constraint(equalTo: registerLabel.trailingAnchor),
            loginTab.widthAnchor.constraint(equalToConstant: 66),
            loginTab.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 365),
            registerButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            loginTitle.leadingAnchor.constraint(equalTo: registerTitle.leadingAnchor),
            loginTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginTitle.widthAnchor.constraint(equalToConstant: 190),
            loginTitle.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            loginEmail.topAnchor.constraint(equalTo: registerFName.topAnchor),
            loginEmail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            loginEmail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            loginPassword.topAnchor.constraint(equalTo: registerEmail.topAnchor),
            loginPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            loginPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: registerLabel.topAnchor),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 82),
            loginLabel.widthAnchor.constraint(equalToConstant: 170),
            loginLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            registerTab.topAnchor.constraint(equalTo: registerLabel.topAnchor),
            registerTab.leadingAnchor.constraint(equalTo: loginLabel.trailingAnchor),
            registerTab.widthAnchor.constraint(equalToConstant: 70),
            registerTab.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: registerButton.bottomAnchor),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 365),
            loginButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc func loginTabTapped() {
        
        loginTitle.isHidden = false
        loginEmail.isHidden = false
        loginEmail.isUserInteractionEnabled = true
        loginPassword.isHidden = false
        loginPassword.isUserInteractionEnabled = true
        loginLabel.isHidden = false
        loginButton.isHidden = false
        loginButton.isUserInteractionEnabled = true
        loginTab.isHidden = true
        loginTab.isUserInteractionEnabled = false
        
        registerTitle.isHidden = true
        registerFName.isHidden = true
        registerFName.isUserInteractionEnabled = false
        registerLName.isHidden = true
        registerLName.isUserInteractionEnabled = false
        registerEmail.isHidden = true
        registerEmail.isUserInteractionEnabled = false
        registerPassword.isHidden = true
        registerPassword.isUserInteractionEnabled = false
        registerLabel.isHidden = true
        registerButton.isHidden = true
        registerButton.isUserInteractionEnabled = false
        registerTab.isHidden = false
        registerTab.isUserInteractionEnabled = true
    }

    @objc func registerTabTapped() {
        
        loginTitle.isHidden = true
        loginEmail.isHidden = true
        loginEmail.isUserInteractionEnabled = false
        loginPassword.isHidden = true
        loginPassword.isUserInteractionEnabled = false
        loginLabel.isHidden = true
        loginButton.isHidden = true
        loginButton.isUserInteractionEnabled = false
        loginTab.isHidden = false
        loginTab.isUserInteractionEnabled = true
        
        registerTitle.isHidden = false
        registerFName.isHidden = false
        registerFName.isUserInteractionEnabled = true
        registerLName.isHidden = false
        registerLName.isUserInteractionEnabled = true
        registerEmail.isHidden = false
        registerEmail.isUserInteractionEnabled = true
        registerPassword.isHidden = false
        registerPassword.isUserInteractionEnabled = true
        registerLabel.isHidden = false
        registerButton.isHidden = false
        registerButton.isUserInteractionEnabled = true
        registerTab.isHidden = true
        registerTab.isUserInteractionEnabled = false
    }
    
    @objc func registerButtonTapped() {
        
        var canRegister = true
        
        var userInputEmail = ""
        if let email = registerEmail.text{
            userInputEmail = email
        }
        if (userInputEmail == "") {
            let alert = UIAlertController(title: "Alert", message: "Please provide an email address", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            canRegister = false
        }
        
        var userInputFName = ""
        if let firstName = registerFName.text{
            userInputFName = firstName
        }
        if (userInputFName == "") {
            let alert = UIAlertController(title: "Alert", message: "Please provide a first name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            canRegister = false
        }
        
        var userInputLName = ""
        if let lastName = registerLName.text{
            userInputLName = lastName
        }
        if (userInputLName == "") {
            let alert = UIAlertController(title: "Alert", message: "Please provide a last name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            canRegister = false
        }
        
        var userInputPassword = ""
        if let password = registerPassword.text{
            userInputPassword  = password
        }
        if (userInputPassword == "") {
            let alert = UIAlertController(title: "Alert", message: "Please set a password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            canRegister = false
        }
        
        
        let email = userInputEmail
        let name = userInputFName + " " + userInputLName
        let password = userInputPassword
        
        if canRegister {
            NetworkManager.registerUser(email: email, name: name, password: password, completion: { (accountDetails) in
                LoginViewController.currentUser = User(session_token: accountDetails.session_token, session_expiration: accountDetails.session_expiration, update_token: accountDetails.update_token, userId: accountDetails.id)
            }) { (errorMessage) in
                self.createAlert(message: errorMessage)
            }
        }
    }
    
    @objc func loginButtonTapped() {
        
        
        var canLogIn = true
        
        var userInputEmail = ""
        if let email = loginEmail.text{
            userInputEmail = email
        }
        if (userInputEmail == "") {
            let alert = UIAlertController(title: "Alert", message: "Please provide an email address", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            canLogIn = false
        }
        
        var userInputPassword = ""
        if let password = loginPassword.text{
            userInputPassword  = password
        }
        if (userInputPassword == "") {
            let alert = UIAlertController(title: "Alert", message: "Please enter your password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            canLogIn = false
        }
        
        
        
        let email = userInputEmail
        let password = userInputPassword
        
        if canLogIn {
            NetworkManager.loginUser(email: email, password: password, completion: { (accountDetails) in
                LoginViewController.currentUser = User(session_token: accountDetails.session_token, session_expiration: accountDetails.session_expiration, update_token: accountDetails.update_token, userId: accountDetails.id)
                self.navigationController?.pushViewController(TabBarController(), animated: true)
            }) { (errorMessage) in
                self.createAlert(message: errorMessage)
            }
        }
    }
    
    func createAlert(message: String) {
        let alert = UIAlertController(title: "Alert!", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    
}
