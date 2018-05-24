//
//  GoogleTranslate.swift
//  iMessageExt
//
//  Created by Mobil Trakya on 16/05/2018.
//  Copyright © 2018 isma. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire_Synchronous
import SwiftyJSON

public class GoogleTranslate {
    public init() {
        
    }
    
    public var apiKey = "APIKEY"
    
    func translate(message: String) -> String{
        var translation = "Null"
        let urlEncodedText = message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let response = Alamofire.request("https://translation.googleapis.com/language/translate/v2?key=\(self.apiKey)&q=\(urlEncodedText ?? "")&source=tr&target=en&format=text", method: .post, encoding: JSONEncoding.default).responseJSON();
        if let json = response.result.value{
            let jsonResponse = JSON(json)
            print(jsonResponse)
            if jsonResponse["data"]["translations"][0]["translatedText"].string != nil
            {
                translation = (jsonResponse["data"]["translations"][0]["translatedText"].string ?? "Null")
            }
            
        }
        return translation
    }
} 
