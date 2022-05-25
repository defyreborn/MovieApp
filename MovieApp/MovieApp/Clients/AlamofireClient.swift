//
//  AlamofireClient.swift
//  MovieApp
//
//  Created by Mubashshir Shaikh on 07/03/19.
//  Copyright © 2019 Mubashshir Shaikh. All rights reserved.
//

import Foundation
import Alamofire
let STORED_TOKEN = "AccessToken"
let API_VERSION = "APIVersion"
let IOS_API_VERSION = "IosAPIVersion"
let DEVICE_NAME = "DeviceName"
let APP_VERSION = "AppVersion"
let OS_VERSION = "OSVersion"



class AlamofireClient : PClient {
    
    func requestJson(_ url: String, method: String, urlParam: [String : AnyObject]?, body: [String : AnyObject]?, header: [String : String]?, completion: @escaping (HTTPURLResponse?, Any?, NSError?) -> Void) {
       

        var httpMethod = HTTPMethod.get
        
        switch method.lowercased() {
        case "post":
            httpMethod = HTTPMethod.post
        case "put":
            httpMethod = HTTPMethod.put
        case "delete":
            httpMethod = HTTPMethod.delete
        default :
            httpMethod = HTTPMethod.get
        }
        switch NetworkReachabilityManager()?.isReachable{
        case true?:
            Alamofire.request(url, method: httpMethod, parameters: (method.lowercased() == "get") ? urlParam : body, encoding: (method.lowercased() == "delete") ? JSONEncoding.default : URLEncoding.default , headers: nil).responseJSON { (response) in
                
               
                
                
                if response.response?.statusCode != 200 {
                    if response.response?.statusCode != nil{
                        
                    }
                    
                }
                else {
                    
                }
                completion(response.response , response.result.value , response.result.error as NSError?)
                if response.result.error?.localizedDescription == "The request timed out."{
                    
                   
                }
                
                
            }
        case false?:
            
            print("error")
            
        case .none:
            print("none")
            
        }
        
    }
    
}

