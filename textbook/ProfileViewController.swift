//
//  ProfileViewController.swift
//  textbook
//
//  Created by Jessica Wu on 12/12/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let aqua: UIColor = UIColor(red: 0.168, green: 0.543, blue: 0.567, alpha: 1)
    let gray: UIColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1)
    
    var userName: UILabel!
    var userLocation: UILabel!
    var userPicture: UIImageView!
    var editButton: UIButton!
    var doneButton: UIButton!
    var currentListingLabel: UILabel!
    var previousPurchaseLabel: UILabel!
    var purchasedListingsLabel: UILabel!
    var profileTableView: UITableView!
    var profileTableViewHeight: CGFloat!
    var retrievedUserInfo: userInfoResponseDataStruct!
    
    
    var currentListings: [Book] = []
    //var previousPurchase: [bookData] = []
    var currentPurchase: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        profileTableViewHeight = view.frame.height*0.6
        
        // fake data
        let book1 = bookData(imageName: "calculus_for_dummies", inputTitle: "Calculus for Dummies", inputAuthor: "Bob Smith", inputCourseName: "Math 101",inputSellType: .sell,inputSellPrice: 100)
        let book2 = bookData(imageName: "international_economics", inputTitle: "International Economics", inputAuthor: "Thomas A. Pugel", inputCourseName: "Econ 201",inputSellType: .sell,inputSellPrice: 200)
        let book3 = bookData(imageName: "introduction_to_psychology", inputTitle: "Introduction To Psychology", inputAuthor: "John Smith", inputCourseName: "PSY 110",inputSellType: .sell,inputSellPrice: 300)
        let book4 = bookData(imageName: "introduction_to_c_programming", inputTitle: "Introduction to C++ programming", inputAuthor: "John Doe", inputCourseName: "CS 101",inputSellType: .exchange,inputSellPrice: 0)
        
        //currentListings = [book1,book2,book3,book4]
        //previousPurchase = [book4,book1,book2,book3]
        //currentPurchase = [book3,book4,book1,book2]
        
        profileTableView = UITableView()
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.dataSource = self
        profileTableView.delegate = self
        profileTableView.register(HomeScreenTableCell.self, forCellReuseIdentifier: HomeScreenTableCell.homeScreenTableCellIdentifier)
        profileTableView.separatorStyle = .none
        profileTableView.showsVerticalScrollIndicator = false
        profileTableView.layer.cornerRadius = 20
        profileTableView.clipsToBounds = true
        profileTableView.alwaysBounceVertical = false
        profileTableView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.addSubview(profileTableView)
        
        setupViews()
        setupContraints()
        retrieveUserInfo()
    }
    
    override func viewDidAppear(_ animated: Bool){
        print("inside view did appear from profile view controller")
        retrieveUserInfo()
    }
    
    private func retrieveUserInfo(){
        
        print("using real user id")
        print("in ProfileViewController")
        
        let fakeSellerID :Int =  LoginViewController.currentUser.id //this is correct now
        
        
        NetworkManager.getUserInfo(currentUserId: fakeSellerID){ responseData in
            self.retrievedUserInfo = responseData
            
            
            //add a book to current listing
            if self.retrievedUserInfo.selling.count>self.currentListings.count{
                for newItem in self.retrievedUserInfo.selling{
                    if self.currentListings.contains(newItem) == false {
                        self.currentListings.append(newItem)
                    }
                }
            }
            //add a book to current purchases
            if self.retrievedUserInfo.cart.count>self.currentPurchase.count{
                for newItem in self.retrievedUserInfo.cart{
                    if self.currentPurchase.contains(newItem) == false {
                        self.currentPurchase.append(newItem)
                    }
                }
            }
            //remove a book from current listing
            if self.retrievedUserInfo.selling.count<self.currentListings.count{
                var indicesToBeRemoved : [Int] = []
                for (index,element) in self.currentListings.enumerated(){
                    if self.retrievedUserInfo.selling.contains(element) == false {
                        indicesToBeRemoved.append(index)
                    }
                }
                for index in indicesToBeRemoved{
                    self.currentListings.remove(at: index)
                }
            }
            //remove a book from current purchases
            if self.retrievedUserInfo.cart.count<self.currentPurchase.count{
                var indicesToBeRemoved : [Int] = []
                for (index,element) in self.currentPurchase.enumerated(){
                    if self.retrievedUserInfo.cart.contains(element) == false {
                        indicesToBeRemoved.append(index)
                    }
                }
                for index in indicesToBeRemoved{
                    self.currentPurchase.remove(at: index)
                }
            }
            
            
            self.userName.text = self.retrievedUserInfo.name
            
            //reload
            DispatchQueue.main.async {
                self.profileTableView.reloadData()
            }

        }
        
        print("currentListings is \(self.currentListings)")
        print("currentPurchase is \(self.currentPurchase)")
        
    }
    
    
    
    
    func setupViews() {
        
        userName = UILabel()
        userName.text = "FirstN LastN"
        userName.textColor = .black
        userName.font = UIFont.boldSystemFont(ofSize: 20)
        userName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userName)
        
        userLocation = UILabel()
        userLocation.text = "Ithaca NY"
        userLocation.textColor = .lightGray
        userLocation.font = UIFont.systemFont(ofSize: 15)
        userLocation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userLocation)
        
        userPicture = UIImageView()
        userPicture.image = UIImage(named: "fake_profile")
        userPicture.contentMode = .scaleAspectFit
        userPicture.layer.cornerRadius = 60
        userPicture.clipsToBounds = true
        userPicture.isUserInteractionEnabled = false
        let singleTapImage: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tappingImage(recognizer:)))
        singleTapImage.numberOfTapsRequired = 1
        userPicture.addGestureRecognizer(singleTapImage)
        userPicture.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userPicture)
        
        editButton = UIButton()
        editButton.clipsToBounds = true
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(aqua, for: .normal)
        editButton.backgroundColor = .white
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        editButton.isUserInteractionEnabled = true
        editButton.isHidden = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editButton)
        
        doneButton = UIButton()
        doneButton.clipsToBounds = true
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(aqua, for: .normal)
        doneButton.backgroundColor = .white
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        doneButton.isUserInteractionEnabled = false
        doneButton.isHidden = true
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(doneButton)
    }
    
    func setupContraints() {
        
        let width = view.frame.width
        let height = view.frame.height
        
        NSLayoutConstraint.activate([
            userPicture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: height*0.05),
            userPicture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPicture.widthAnchor.constraint(equalToConstant: 120),
            userPicture.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: userPicture.bottomAnchor, constant: height*0.02),
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userName.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            userLocation.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 5),
            userLocation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userLocation.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: height*0.03),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -width*0.05),
            editButton.widthAnchor.constraint(equalToConstant: 50),
            editButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: height*0.03),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -width*0.05),
            doneButton.widthAnchor.constraint(equalToConstant: 50),
            doneButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // COMMENTED OUT FOR NOW, uncomment when linked to backend
        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: userLocation.bottomAnchor, constant: 10),
            profileTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    @objc func editButtonTapped() {
        editButton.isHidden = true
        editButton.isUserInteractionEnabled = false
        doneButton.isHidden = false
        doneButton.isUserInteractionEnabled = true
        userPicture.isUserInteractionEnabled = true
    }
    
    @objc func doneButtonTapped() {
        doneButton.isHidden = true
        doneButton.isUserInteractionEnabled = false
        editButton.isHidden = false
        editButton.isUserInteractionEnabled = true
        userPicture.isUserInteractionEnabled = false
    }
    
    @objc func tappingImage(recognizer: UIGestureRecognizer){
        //image tapped
        showChooseSourceTypeAlertController()
    }
}

extension ProfileViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Row 1: Current Listings
        // Row 2: Current in Cart
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeScreenTableCell.homeScreenTableCellIdentifier, for: indexPath) as! HomeScreenTableCell
        
        if indexPath.row == 0{
             cell.configure(rowName: "Current Listings", rowData: currentListings)
             //cell.newScreenDelegate = self
        }
        
        if indexPath.row == 1{
             cell.configure(rowName: "Current Purchases", rowData: currentPurchase)
             //cell.newScreenDelegate = self
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return profileTableViewHeight*0.9/2 //0.9 serves as padding
    }
    
    
}

extension ProfileViewController:UITableViewDelegate{
    
}

extension ProfileViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    // we need UINavigationControllerDelegate because we need to present a new view
    
    func showChooseSourceTypeAlertController() {
        
        let photoLibraryAction = UIAlertAction(title: "Choose A Photo", style: .default) { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        
        let cameraAction = UIAlertAction(title: "Take A New Photo", style: .default) { (action) in
            self.showImagePickerController(sourceType: .camera)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(photoLibraryAction)
        alert.addAction(cameraAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func showImagePickerController(sourceType:UIImagePickerController.SourceType){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = sourceType
        
        present(imagePickerController,animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userPicture.image = selectedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
