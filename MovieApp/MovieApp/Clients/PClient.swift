//
//  PClient.swift
//  MovieApp
//
//  Created by Mubashshir Shaikh on 07/03/19.
//  Copyright © 2019 Mubashshir Shaikh. All rights reserved.
//

import Foundation
import UIKit

protocol PClient {
    // Request to URL
    func requestJson(_ url:String, method:String, urlParam:[String:AnyObject]?, body:[String:AnyObject]?, header:[String:String]?, completion: @escaping(_ response:HTTPURLResponse?, _ json:Any?, _ error:NSError?)-> Void)
    //func requestData(_ url:String, method:String, urlParam:String?, body:[String:AnyObject]?, header:[String:String], completion: @escaping(_ response:HTTPURLResponse?, _ data:Data?, _ error:NSError?)-> Void)
}
