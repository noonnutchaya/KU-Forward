//
//  Test.swift
//  GSign
//
//  Created by Nutchaya Limpalasook on 26/11/2562 BE.
//  Copyright © 2562 Seemu. All rights reserved.
//

import UIKit
import FirebaseStorage

class Test: UIViewController {

    
    @IBOutlet weak var uploadImage: UIImageView!
    
    let filename = "111.jpg"
    
    var imageReference: StorageReference {
        return Storage.storage().reference().child("images")
    }
    
    @IBAction func onUploadTapped(_ sender: Any) {
        print("1")
        guard let image = uploadImage.image else { return }
        print("2")
        guard let imageData = image.jpegData(compressionQuality: 1) else { return }
        print("3")
        let uploadImageRef = imageReference.child(filename)
        print("4")
        let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
            print("UPLOAD TASK FINISHED")
            print(metadata ?? "NO METADATA")
            print(error ?? "NO ERROR")
        }
        
        uploadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress ?? "NO MORE PROGRESS")
        }
        
        uploadTask.resume()
    }
    
    
}
