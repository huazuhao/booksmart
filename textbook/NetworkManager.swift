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
    
    
    
    
}
