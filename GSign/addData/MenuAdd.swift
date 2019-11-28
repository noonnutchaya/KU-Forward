//
//  MenuAdd.swift
//  GSign
//
//  Created by Nutchaya Limpalasook on 27/11/2562 BE.
//  Copyright © 2562 Seemu. All rights reserved.
//

import UIKit

class MenuAdd: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func GoBook(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Book")
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    
    @IBAction func GoClothes(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Clothes")
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    @IBAction func GoAccessories(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Accessories")
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    @IBAction func GoOther(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Other")
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    
    @IBAction func GoMenuAdd(_ sender: Any) {
    }
    
    @IBAction func GoMenuUpload(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MenuUpload")
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    @IBAction func GoUser(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UserProfile")
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    

}
