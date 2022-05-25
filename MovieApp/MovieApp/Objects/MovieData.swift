//
//  MovieData.swift
//  MovieApp
//
//  Created by Mubashshir Shaikh on 06/03/19.
//  Copyright © 2019 Mubashshir Shaikh. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieData: Mappable {
    
    //MARK:- params
    
    private var name = ""
    private var overView = ""
    private var vote = 0.0
    private var image = ""
    private var poster = ""
    private var releaseDate = ""
    
    
    //MARK:- Init Methods
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
       
        self.name                    <- map["title"]
        self.overView                <- map["overview"]
        self.vote                    <- map["vote_average"]
        self.image                   <- map["backdrop_path"]
        self.poster                  <- map["poster_path"]
        self.releaseDate             <- map["release_date"]
        
    }
    
    //MARK:- Getters and Setters
    
    internal var getName:String {
        get {
            return self.name
        }
    }
    
    internal var getOverView:String {
        get {
            return self.overView
        }
        
    }
    
    internal var getVote : Double {
        get {
            return self.vote
        }
    }
    
    internal var getImage:String {
        get {
            return self.image
        }
    }
    
    internal var getPoster:String {
        get {
            return self.poster
        }
    }
    
    internal var getReleaseDate:String {
        get {
            return self.releaseDate
        }
    }
    
}
