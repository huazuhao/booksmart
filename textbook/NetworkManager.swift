//
//  NetworkManager.swift
//  textbook
//
//  Created by Zuhao Hua on 12/5/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private static let host = "http://0.0.0.0:5000"
    
    static func getRecentlyAdded(completion: @escaping ([Book]) -> Void) {
        let endpoint = "\(host)/api/books/all/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let recentlyAddedResponse = try? jsonDecoder.decode(RecentlyAdded.self, from: data) {
                    // Instructions: Use completion to handle response
                    let receivedData = recentlyAddedResponse.data
                    completion(receivedData)
                }
                else{
                    print("could not decode data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func postBookNoImage(newBookDataNoImage:uploadBookBackEndNoImageStruct,completion:@escaping (uploadBookBackEndNoImageResponseStruct)->Void){
        
        let parameters: [String:Any] = [
            "title":newBookDataNoImage.title,
            "price":newBookDataNoImage.price,
            "sellerId":newBookDataNoImage.sellerId,
            "image":"",
            "author":newBookDataNoImage.author,
            "courseName":newBookDataNoImage.courseName,
            "isbn":newBookDataNoImage.isbn,
            "edition":newBookDataNoImage.edition
        ]
        
        let endpoint = "\(host)/api/books/sell/"
        
        AF.request(endpoint,method: .post,parameters: parameters,encoding: JSONEncoding.default).validate(statusCode: 200..<600).responseData { (response) in
            switch response.result {
            case .success( let data):
                let jsonDecoder = JSONDecoder()
                if let responseFromBackEnd = try? jsonDecoder.decode(uploadBookBackEndNoImageResponse.self, from: data) {
                    // Instructions: Use completion to handle response
                    let receivedData = responseFromBackEnd.data
                    completion(receivedData)
                }
                print("successfully uploaded a new book (no image) to sell")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func postBookImage(newBookImage:uploadBookImage){

        let parameters: [String: Any] = [
            "bookId": newBookImage.bookId,
            "imageData": newBookImage.imageData
        ]
        
        let endpoint = "\(host)/api/upload/"
        AF.request(endpoint,method: .post,parameters: parameters,encoding: JSONEncoding.default).validate(statusCode: 200..<600).response { (response) in
            switch response.result{
            case.success( _):
                print("successfully uploaded a book image")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
        

    
    
    
}
