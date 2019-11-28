//
//  HomePage.swift
//  GSign
//
//  Created by Nutchaya Limpalasook on 26/11/2562 BE.
//  Copyright © 2562 Seemu. All rights reserved.
//

import UIKit
import FirebaseStorage

class HomePage: UIViewController {
   let storage = Storage.storage(url:"gs://ku-forward.appspot.com")
 

    override func viewDidLoad() {
        let storageRef = storage.reference()
       let localFile = URL(string: "Desktops/111.jpg")!
        let riversRef = storageRef.child("images/111.jpg")
        super.viewDidLoad()
        
        let uploadTask = riversRef.putFile(from: localFile, metadata: nil) { metadata, error in
          guard let metadata = metadata else {
            // Uh-oh, an error occurred!
            return
          }
          // Metadata contains file metadata such as size, content-type.
          let size = metadata.size
          // You can also access to download URL after upload.
          riversRef.downloadURL { (url, error) in
            guard let downloadURL = url else {
              // Uh-oh, an error occurred!
              return
            }
          }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
