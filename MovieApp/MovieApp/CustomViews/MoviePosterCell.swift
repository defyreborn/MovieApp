//
//  MoviePosterCell.swift
//  MovieApp
//
//  Created by Mubashshir Shaikh on 06/03/19.
//  Copyright © 2019 Mubashshir Shaikh. All rights reserved.
//

import UIKit
import SDWebImage

class MoviePosterCell: UICollectionViewCell {
    
    
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    internal var movieObject:MovieData? {
        didSet {
            self.updateUI()
        }
    }
    
    internal func updateUI() {
        
        if let resMovieObj = self.movieObject{
           let url = URL(string: MOVIES_IMAGE_URL+"\(resMovieObj.getPoster)")
           self.posterImageView.sd_setImage(with: url, completed: nil)
            self.lblMovieName.text = resMovieObj.getName

            
        }
        
    }

}
