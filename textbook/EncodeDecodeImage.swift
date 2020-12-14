//
//  EncodeDecodeImage.swift
//  textbook
//
//  Created by Zuhao Hua on 12/12/20.
//  Copyright © 2020 Anya Ji. All rights reserved.
//

import Foundation
import UIKit

class EncodeDecodeImage {
    func convertImageToBase64String (img: UIImage) -> String {
        //return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
        return img.pngData()?.base64EncodedString() ?? ""
    }
    
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
        let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
        let image = UIImage(data: imageData!)
        return image!
    }
}

