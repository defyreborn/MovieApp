//
//  ViewController.swift
//  MovieApp
//
//  Created by Mubashshir Shaikh on 06/03/19.
//  Copyright © 2019 Mubashshir Shaikh. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var movieCollectionView: UICollectionView!
    
   var navigationControllerNew = UINavigationController.init()
    var pageNumber:Int = 1
    var movieDataList =  [MovieData]()
    
    let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMoviesFor(page:pageNumber)
        
        
    }

    
    //MARK:- Collection View Delegate and Data Source Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieDataList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: MOVIE_CELL, for: indexPath) as? MoviePosterCell {
            cell.movieObject = self.movieDataList[indexPath.row]
            if indexPath.row ==  (movieDataList.count - 5){
                self.pageNumber = self.pageNumber + 1
                self.getMoviesFor(page: self.pageNumber)
            }
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: ((self.view.frame.width/2) - 2), height: ((self.view.frame.width/2) - 5) * 1.5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        

         if let movieDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: MOVIE_DETAIL_PAGE) as? MovieDetailViewController {
            movieDetailViewController.movieData = self.movieDataList[indexPath.row]
            self.navigationController?.pushViewController(movieDetailViewController, animated: true)
            
           
            }
    }
    
    func getMoviesFor(page:Int) {
        self.showSpinnerWithTouchEnabled(isEnabled: false)
        self.utility.myClient.requestJson(GET_MOVIES+"\(page)", method: "get", urlParam: nil, body: nil, header: nil) { (response, json, error) in
            print(json as Any)
            if response?.statusCode == 200 {
                
                if let resJson = json as? [String:AnyObject] {
                    if let resData = resJson["results"] as? [[String:Any]] {
                        let movieData = Mapper<MovieData>().mapArray(JSONArray: resData)
                        for item in movieData {
                            self.movieDataList.append(item)
                        }
                        
                        self.movieCollectionView.reloadSections([0])
                        self.hideSpinner()
                    }
                }
            }
            
        }
    }
}


