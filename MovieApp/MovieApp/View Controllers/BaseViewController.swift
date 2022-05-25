//
//  BaseViewController.swift
//  MovieApp
//
//  Created by Mubashshir Shaikh on 07/03/19.
//  Copyright © 2019 Mubashshir Shaikh. All rights reserved.
//

import UIKit


public class BaseViewController: UIViewController {
    
    //MARK:- Params
    let utility = Utility.sharedInstance()
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    @IBOutlet var navBarHeightConst: NSLayoutConstraint!
    @IBOutlet var btnLeft: UIButton!
    @IBOutlet var btnRight: UIButton!
    @IBOutlet var lblNavigationTitle: UILabel?
    @IBOutlet var viewNavigationBar: UIView?
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var navTitleBottomConst: NSLayoutConstraint?
    @IBOutlet var spinner : UIActivityIndicatorView! = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
   
    
    //MARK:- View Life Cycle Methods
    override public func viewDidLoad() {
        super.viewDidLoad()
        
       
        if self.searchBar != nil {
            self.searchBar.barTintColor = UIColor.clear
            self.searchBar.backgroundColor = UIColor.clear
            self.searchBar.isTranslucent = true
            self.searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            self.searchBar.placeholder = "Search Categories"
            self.searchBar.showsCancelButton = false
            self.searchBar.isHidden = true
        }
        if self.navTitleBottomConst != nil {
            self.navTitleBottomConst?.constant = 12
        }
        if self.spinner != nil {
            self.spinner.color = UIColor.blue
            self.spinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.spinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
        if self.navBarHeightConst != nil {
            if deviceIsiPhoneX() {
                self.navBarHeightConst.constant = 85.0
            } else {
                self.navBarHeightConst.constant = 65.0
            }
        }
        self.setupApplicationFonts()
    }
    
    //MARK:- Memory Management Methods
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK:- Custom Methods
    func setupApplicationFonts(){
        //        let fontType : UIFont! =  UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: "Roboto"))
        //        UILabel.appearance().font = fontType
        //        UITextField.appearance().font = fontType
        //        UITextView.appearance().font = fontType
        //        UILabel.appearance(whenContainedInInstancesOf: [UIButton.self]).font = fontType
    }
    
    func showSpinnerWithTouchEnabled(isEnabled : Bool){
        if isEnabled {
            DispatchQueue.main.async {
                self.appDelegate?.window?.rootViewController?.view.isUserInteractionEnabled = true
            }
        } else {
            DispatchQueue.main.async {
                self.appDelegate?.window?.rootViewController?.view.isUserInteractionEnabled = false
            }
        }
        
        if self.spinner != nil {
            self.spinner.startAnimating()
            
            
        }
        
    }
    
    @objc func dismissLoadingOnTapGesture(gesture: UIGestureRecognizer) {
        self.spinner.startAnimating()
       
    }
    
    func hideSpinner(){
        
        DispatchQueue.main.async {
            self.appDelegate?.window?.rootViewController?.view.isUserInteractionEnabled = true
        }
        
        if self.spinner != nil {
            self.spinner.stopAnimating()
            
        }
    }
    
    func deviceIsiPhoneX() -> Bool {
        if UIDevice().userInterfaceIdiom == .phone {
            let height : CGFloat =  UIScreen.main.nativeBounds.size.height
            switch height {
            case 2436, 1792, 1624 :
                return true
                
            default:
                return false
            }
        }
        return false
        
    }
    
    // not proper
    
    func getDevice() -> String
    {
        switch UIScreen.main.nativeBounds.height {
        case 1136:
            print("iPhone 5 or 5S or 5C")
            return "iPhone5"
        case 1334:
            print("iPhone 6/6S/7/8")
            return "iPhone6"
        case 1920, 2208:
            print("iPhone 6+/6S+/7+/8+")
            return "iPhone6+"
        case 2436:
            print("iPhone X")
            return "iPhoneX"
        default:
            print("unknown")
        }
        return ""
    }
    
    func checkIsSimulator() -> Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

    
    //MARK:- UIAction Methods
    @IBAction func btnLeftClickAction(_ sender: Any) {
    }
    
    @IBAction func btnRightClickAction(_ sender: Any) {
    }
    
    deinit {
        print("Base Deallocating")
    }
}
