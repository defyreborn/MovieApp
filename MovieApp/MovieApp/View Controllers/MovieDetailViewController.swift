//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Mubashshir Shaikh on 07/03/19.
//  Copyright © 2019 Mubashshir Shaikh. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailViewController: BaseViewController {

    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblOverView: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    internal  var movieData :  MovieData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpData()
        self.hideSpinner()
    }
    
    func setUpData() {
        if let resData = self.movieData {
            self.lblReleaseDate.text = resData.getReleaseDate
            self.lblRate.text = String(resData.getVote)
            self.lblOverView.text = resData.getOverView
            self.lblMovieName.text = resData.getName
            
            let url = URL(string: MOVIES_IMAGE_URL+"\(resData.getImage)")
            self.movieImageView.sd_setImage(with: url, completed: nil)
            
            
        }
    }
    //MARK:- UIAction Methods
    override func btnLeftClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
