//
//  UserProfile.swift
//  GSign
//
//  Created by Nutchaya Limpalasook on 27/11/2562 BE.
//  Copyright © 2562 Seemu. All rights reserved.
//

import UIKit
import GoogleSignIn

class UserProfile: UIViewController,GIDSignInUIDelegate {

    @IBOutlet weak var UserText: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSignOut(_ sender: Any) {
        print("Signing Out")
        GIDSignIn.sharedInstance().signOut()
        print("Signed out")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
//        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
//    @IBAction func ChangeToTimeline(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "MenuAdd")
//        UIApplication.shared.keyWindow?.rootViewController = vc
//    }
//
//    @IBAction func ChangeToUpload(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//               let vc = storyboard.instantiateViewController(withIdentifier: "ImageUpload")
//               UIApplication.shared.keyWindow?.rootViewController = vc
//    }
//
//    @IBAction func ChangeToUser(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "UserProfile")
//        UIApplication.shared.keyWindow?.rootViewController = vc
//    }
    
}
