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
            
            print("response from backend is \(response)")
            
            switch response.result {
            case .success(let data):
                
                print("data is \(data)")
                
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let recentlyAddedResponse = try? jsonDecoder.decode(RecentlyAdded.self, from: data) {
                    // Instructions: Use completion to handle response
                    let data = recentlyAddedResponse.data
                    print("inside network manager and getting recently added")
                    completion(data)
                }
                else{
                    print("could not decode data")
                }
            case .failure(let error):
                print("failed to get data from backend")
                print(error.localizedDescription)
            }
        }
    }
    
}
