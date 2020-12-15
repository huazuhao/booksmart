//
//  AddNewBook.swift
//  textbook
//
//  Created by Zuhao Hua on 11/29/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import UIKit

class AddNewBook: UIViewController {

    let pink: UIColor = UIColor(red: 1, green: 0.479, blue: 0.479, alpha: 1)
    
    var bookImage: UIImageView!
    var bookTitle: UITextField!
    var bookAuthor: UITextField!
    var bookISBN: UITextField!
    var bookPrice: UITextField!
    var courseUsedFor: UITextField!
    var bookEdition: UITextField!
    //var courseDescription: UITextView!
    //var courseDescriptionPlaceHolder = "Course Description"
    var photosLabel: UILabel!
    var photoPrompt: UILabel!
    var confirmButton: UIButton!
    var bookConditionPicker:UIPickerView!
    var bookConditionPickerData: [String] = [String]()
    var selectedBookCondition: String!
    
    let sidePadding:CGFloat = 25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bookConditionPickerData = ["Brand New","Slightly Used","Moderately Used","Heavily Used"]
        
        self.view.backgroundColor = .white
        
        bookTitle = UITextField()
        bookTitle.translatesAutoresizingMaskIntoConstraints = false
        let bookTitlePlaceHolder=NSAttributedString(string: "Textbook Title", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        bookTitle.textColor = .gray
        bookTitle.attributedPlaceholder=bookTitlePlaceHolder
        bookTitle.layer.borderColor = UIColor.black.cgColor
        bookTitle.layer.backgroundColor = UIColor.white.cgColor
        bookTitle.layer.borderWidth = 0.0
        bookTitle.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        bookTitle.layer.shadowOpacity = 1.0
        bookTitle.layer.shadowRadius = 0.0
        view.addSubview(bookTitle)
        
        bookAuthor = UITextField()
        bookAuthor.translatesAutoresizingMaskIntoConstraints = false
        let bookAuthorPlaceHolder=NSAttributedString(string: "Author(s)", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        bookAuthor.textColor = .gray
        bookAuthor.attributedPlaceholder=bookAuthorPlaceHolder
        bookAuthor.layer.borderColor = UIColor.black.cgColor
        bookAuthor.layer.backgroundColor = UIColor.white.cgColor
        bookAuthor.layer.borderWidth = 0.0
        bookAuthor.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        bookAuthor.layer.shadowOpacity = 1.0
        bookAuthor.layer.shadowRadius = 0.0
        view.addSubview(bookAuthor)
        
        bookISBN = UITextField()
        bookISBN.translatesAutoresizingMaskIntoConstraints = false
        let bookISBNPlaceHolder=NSAttributedString(string: "ISBN", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        bookISBN.textColor = .gray
        bookISBN.attributedPlaceholder=bookISBNPlaceHolder
        bookISBN.layer.borderColor = UIColor.black.cgColor
        bookISBN.layer.backgroundColor = UIColor.white.cgColor
        bookISBN.layer.borderWidth = 0.0
        bookISBN.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        bookISBN.layer.shadowOpacity = 1.0
        bookISBN.layer.shadowRadius = 0.0
        view.addSubview(bookISBN)
        
        bookPrice = UITextField()
        bookPrice.translatesAutoresizingMaskIntoConstraints = false
        let bookPricePlaceHolder=NSAttributedString(string: "Price", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        bookPrice.textColor = .gray
        bookPrice.attributedPlaceholder=bookPricePlaceHolder
        bookPrice.layer.borderColor = UIColor.black.cgColor
        bookPrice.layer.backgroundColor = UIColor.white.cgColor
        bookPrice.layer.borderWidth = 0.0
        bookPrice.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        bookPrice.layer.shadowOpacity = 1.0
        bookPrice.layer.shadowRadius = 0.0
        view.addSubview(bookPrice)
        
        courseUsedFor = UITextField()
        courseUsedFor.translatesAutoresizingMaskIntoConstraints = false
        let courseUsedForPlaceHolder=NSAttributedString(string: "Course Used For", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        courseUsedFor.textColor = .gray
        courseUsedFor.attributedPlaceholder=courseUsedForPlaceHolder
        courseUsedFor.layer.borderColor = UIColor.black.cgColor
        courseUsedFor.layer.backgroundColor = UIColor.white.cgColor
        courseUsedFor.layer.borderWidth = 0.0
        courseUsedFor.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        courseUsedFor.layer.shadowOpacity = 1.0
        courseUsedFor.layer.shadowRadius = 0.0
        view.addSubview(courseUsedFor)
        
        bookEdition = UITextField()
        bookEdition.translatesAutoresizingMaskIntoConstraints = false
        let bookEditionPlaceHolder=NSAttributedString(string: "Edition", attributes:[NSAttributedString.Key.foregroundColor :UIColor.darkGray])
        bookEdition.textColor = .gray
        bookEdition.attributedPlaceholder=bookEditionPlaceHolder
        bookEdition.layer.borderColor = UIColor.black.cgColor
        bookEdition.layer.backgroundColor = UIColor.white.cgColor
        bookEdition.layer.borderWidth = 0.0
        bookEdition.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        bookEdition.layer.shadowOpacity = 1.0
        bookEdition.layer.shadowRadius = 0.0
        view.addSubview(bookEdition)
        
        bookConditionPicker = UIPickerView()
        bookConditionPicker.translatesAutoresizingMaskIntoConstraints = false
        bookConditionPicker.delegate = self
        bookConditionPicker.dataSource = self
        view.addSubview(bookConditionPicker)
        
        
//        courseDescription = UITextView()
//        courseDescription.layer.cornerRadius = 20
//        courseDescription.clipsToBounds = true
//        courseDescription.isEditable = true
//        courseDescription.isScrollEnabled = false
//        courseDescription.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
//        courseDescription.textColor = .darkGray
//        courseDescription.font = .systemFont(ofSize: 18)
//        courseDescription.text = courseDescriptionPlaceHolder
//        courseDescription.translatesAutoresizingMaskIntoConstraints = false
//        courseDescription.delegate = self
//        courseDescription.returnKeyType = .done
//        view.addSubview(courseDescription)
        
        photosLabel = UILabel()
        photosLabel.text = "Submit Photos"
        photosLabel.textAlignment = .left
        photosLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photosLabel)
        
        photoPrompt = UILabel()
        photoPrompt.text = "Take a photo of the book"
        photoPrompt.textAlignment = .left
        photoPrompt.font = UIFont.systemFont(ofSize: 18)
        photoPrompt.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoPrompt)
        
        confirmButton = UIButton()
        confirmButton.layer.cornerRadius = 20
        confirmButton.clipsToBounds = true
        confirmButton.setTitle("Confirm To Sell", for: .normal)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.backgroundColor = pink
        
        
        view.addSubview(confirmButton)
        
        bookImage = UIImageView()
        bookImage.image = UIImage(named: "add_image_icon")
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.contentMode = .scaleAspectFill
        bookImage.layer.cornerRadius = 30
        bookImage.clipsToBounds = true
        bookImage.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        bookImage.isUserInteractionEnabled = true
        let singleTapImage: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tappingImage(recognizer:)))
        singleTapImage.numberOfTapsRequired = 1
        bookImage.addGestureRecognizer(singleTapImage)
        view.addSubview(bookImage)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            bookTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            bookTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            bookTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding),
            bookTitle.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            bookAuthor.topAnchor.constraint(equalTo: bookTitle.bottomAnchor, constant: 10),
            bookAuthor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            bookAuthor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding),
            bookAuthor.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            bookEdition.topAnchor.constraint(equalTo: bookAuthor.bottomAnchor, constant: 10),
            bookEdition.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            bookEdition.widthAnchor.constraint(equalToConstant: (view.frame.width-sidePadding*2)/2),
            bookEdition.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            bookPrice.topAnchor.constraint(equalTo: bookAuthor.bottomAnchor, constant: 10),
            bookPrice.leadingAnchor.constraint(equalTo: bookEdition.trailingAnchor, constant: 5),
            bookPrice.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding),
            bookPrice.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            bookISBN.topAnchor.constraint(equalTo: bookPrice.bottomAnchor, constant: 10),
            bookISBN.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            bookISBN.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding),
            bookISBN.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        NSLayoutConstraint.activate([
            courseUsedFor.topAnchor.constraint(equalTo: bookISBN.bottomAnchor, constant: 10),
            courseUsedFor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            courseUsedFor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding),
            courseUsedFor.heightAnchor.constraint(equalToConstant: 30)
        ])

//        NSLayoutConstraint.activate([
//            courseDescription.topAnchor.constraint(equalTo: courseUsedFor.bottomAnchor, constant: 10),
//            courseDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
//            courseDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding),
//            courseDescription.bottomAnchor.constraint(equalTo: photosLabel.topAnchor, constant: -20)
//        ])
        
        NSLayoutConstraint.activate([
            bookConditionPicker.topAnchor.constraint(equalTo: courseUsedFor.bottomAnchor, constant: 30),
            bookConditionPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            bookConditionPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding),
            bookConditionPicker.bottomAnchor.constraint(equalTo: photosLabel.topAnchor, constant: -30)
        ])

        NSLayoutConstraint.activate([
            photosLabel.bottomAnchor.constraint(equalTo: photoPrompt.topAnchor, constant: -5),
            photosLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            photosLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding),
            photosLabel.heightAnchor.constraint(equalToConstant: 20)
        ])

        NSLayoutConstraint.activate([
            photoPrompt.bottomAnchor.constraint(equalTo: bookImage.topAnchor, constant: -20),
            photoPrompt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            photoPrompt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding),
            photoPrompt.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            bookImage.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -20),
            bookImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            bookImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding),
            bookImage.heightAnchor.constraint(equalToConstant: view.frame.height*0.2)
        ])
        
        NSLayoutConstraint.activate([
            confirmButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            confirmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding),
            confirmButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
    }
    
    @objc func tappingImage(recognizer: UIGestureRecognizer){
        //image tapped
        showChooseSourceTypeAlertController()
    }
    
    func uploadImage(){
        print("there is a fake book id")
        let fakeBookID:Int = LoginViewController.currentUser.id //this is correct now
        
        let imageData:NSData = bookImage.image!.pngData()! as NSData
        let imageStr = imageData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))

        let uploadImageData = uploadBookImage(imageData: imageStr, bookId: fakeBookID)
        
        NetworkManager.postBookImage(newBookImage: uploadImageData)
    }
    
    func uploadBookWithNoImage(){
        
        var canUpload = true
        
        let fakeSellerID :Int = LoginViewController.currentUser.id //this is now correct

        
        var userInputTitle:String = ""
        if let title = bookTitle.text{
            userInputTitle = title
        }
        if (userInputTitle == "") {
            let alert = UIAlertController(title: "Alert", message: "Please provide a book title", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            canUpload = false
        }
        
        var userInputAuthor:String = ""
        if let author = bookAuthor.text{
            userInputAuthor = author
        }
        if (userInputAuthor == "") {
            let alert = UIAlertController(title: "Alert", message: "Please provide the author(s) of the book", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            canUpload = false
        }
        
        var userInputEdition:String = ""
        if let edition = bookEdition.text{
            userInputEdition = edition
        }
        if (userInputEdition == "") {
            let alert = UIAlertController(title: "Alert", message: "Please provide a book edition", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            canUpload = false
        }
        
        var userInputPrice:Double = -1
        if let price = Double(bookPrice.text!){
            userInputPrice = price
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Please provide a valid price", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            canUpload = false
        }
        
        var userInputCourseName:String = ""
        if let courseName = courseUsedFor.text{
            userInputCourseName = courseName
        }
        if (userInputCourseName == "") {
            let alert = UIAlertController(title: "Alert", message: "Please enter course used for", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            canUpload = false
        }
        
        
        var userInputCondition:String = ""
        if let condition = selectedBookCondition {
            userInputCondition = condition
        }
        if (userInputCondition == "") {
            let alert = UIAlertController(title: "Alert", message: "Please select a book condition", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            canUpload = false
        }

        
        var userInputISBN:String = ""
        if let isbn = bookISBN.text{
            userInputISBN = isbn
        }
        
        
        let imageData:NSData = bookImage.image!.pngData()! as NSData
        let imageStr = imageData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        
        
        if canUpload {
            let uploadBook = uploadBookBackEndNoImageStruct(title: userInputTitle, price: userInputPrice, sellerId: fakeSellerID, image: imageStr, author: userInputAuthor, courseName: userInputCourseName, isbn: userInputISBN, edition: userInputEdition, condition: userInputCondition)
        
            
            var returnedBookID:Int?
            NetworkManager.postBookNoImage(newBookDataNoImage: uploadBook){ responseData in
                returnedBookID = responseData.id
                
            }
            
            //set the field back to default
            self.bookTitle.text = ""
            self.bookAuthor.text = ""
            self.bookEdition.text = ""
            self.bookPrice.text = ""
            self.bookISBN.text = ""
            self.courseUsedFor.text = ""
            
        }
        
    }
    
    @objc func confirmButtonTapped(){
        print("confirm button tapped. do something")

        uploadBookWithNoImage()
        TabBarController().selectedIndex = 0
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

extension AddNewBook:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
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
            bookImage.image = selectedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}

extension AddNewBook: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedBookCondition = bookConditionPickerData[row]
    }
}

extension AddNewBook: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // Number of columns of data
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // The number of rows of data
        return bookConditionPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bookConditionPickerData[row]
    }
    
    
}

//extension AddNewBook : UITextViewDelegate {
//
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.text == courseDescriptionPlaceHolder{
//            textView.text = ""
//            textView.textColor = UIColor.black
//        }
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text == ""{
//            textView.text = courseDescriptionPlaceHolder
//            textView.textColor = .darkGray
//        }
//    }
//
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if text == "\n"{
//            textView.resignFirstResponder()
//        }
//        return true
//    }
//
//
//}
