

import UIKit
import GoogleSignIn
import Firebase

class ViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        //GIDSignIn.sharedInstance().signInSilently()
        
        let gSignIn = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 130, height: 48))
        gSignIn.center.x = view.center.x+10
        gSignIn.center.y = view.center.y + 50
        view.addSubview(gSignIn)
        
        // Add sign out button
        let signOut = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 30))
        signOut.backgroundColor = UIColor.red
        signOut.setTitle("Sign Out", for: .normal)
        signOut.center = view.center
        signOut.center.y = view.center.y + 180
        signOut.addTarget(self, action: #selector(self.signOut(_:)), for: .touchUpInside)
//        self.view.addSubview(signOut)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func signOut(_ sender: UIButton) {
        print("Signing Out")
        GIDSignIn.sharedInstance().signOut()
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Failed to sign out")
            print(signOutError)
            return
        }
        
        print("Signed out")
        
    }


}

