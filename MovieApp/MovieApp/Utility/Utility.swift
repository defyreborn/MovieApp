//
//  Utility.swift
//  MovieApp
//
//  Created by Mubashshir Shaikh on 07/03/19.
//  Copyright © 2019 Mubashshir Shaikh. All rights reserved.
//

import Foundation
import UIKit



let GET_MOVIES                 = "https://api.themoviedb.org/3/movie/popular?api_key=ec0c46bd5451abc5e2f71af4841eca1a&language=en-US&page="

let MOVIES_IMAGE_URL           = "http://image.tmdb.org/t/p/w185"



//=======================================================================================================================
/**
 *  Identifiers for Each Cell
 **/

//MARK:- Cell Identifiers
let MOVIE_CELL                              = "movieCell"





//=======================================================================================================================
/**
 *  Useful Identifiers for Each Controller in App
 **/
//MARK:- ###############################

let MOVIE_LIST_PAGE                                = "ViewController"
let MOVIE_DETAIL_PAGE                              = "MovieDetailViewController"



class Utility {
    
    fileprivate static let shared = Utility()
    fileprivate let dateFormatter = DateFormatter()
    
    internal let myClient:PClient = AlamofireClient()
    
    
    
    
    
    internal let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    internal let screenWidth = UIScreen.main.bounds.size.width
    internal let screenHeight = UIScreen.main.bounds.size.height
   
    
    internal static func sharedInstance() -> Utility {
        return shared
    }
}
