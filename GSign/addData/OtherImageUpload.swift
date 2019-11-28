//
//  OtherImageUpload.swift
//  GSign
//
//  Created by Nutchaya Limpalasook on 27/11/2562 BE.
//  Copyright © 2562 Seemu. All rights reserved.
//

import UIKit
import Firebase

class OtherImageUpload: UIViewController {

        @IBOutlet weak var myImageView: UIImageView!
        
        @IBOutlet weak var titleText: UITextField!
        @IBOutlet weak var priceText: UITextField!
        @IBOutlet weak var contactText: UITextField!
        @IBOutlet weak var detailText: UITextView!
        
        var ref = DatabaseReference.init()
        
        let imagePicker = UIImagePickerController()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.ref = Database.database().reference()
            let tapGesture = UITapGestureRecognizer()
            
            
            tapGesture.addTarget(self, action:
                #selector(OtherImageUpload.openGallery(tapGesture:)))
            
            myImageView.isUserInteractionEnabled = true
            myImageView.addGestureRecognizer(tapGesture)
        }
        
    @IBAction func GoToMenuAdd(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MenuAdd")
        UIApplication.shared.keyWindow?.rootViewController = vc
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
        
        
        @objc func openGallery(tapGesture: UITapGestureRecognizer) {
            self.setupImagePicker()
        }
        
        @IBAction func btnSaveClick(_ sender: Any) {
            self.saveFIRData()
        }
        
        func saveFIRData()  {
    //        let dict = ["name": "Yogesh", "text": txtText.text!]
    //        self.ref.child("chat").childByAutoId().setValue(dict)
            
            self.uploadImage(self.myImageView.image!)   { url in
                self.saveImage(name: self.detailText.text!, profileURL: url!) { success in
                    if success != nil{
                        print("Yeah yes")
                    }
                }
            }
    //        let now = Date().currentTimeMillis()
    //        print(now)
        }
            
    }

    extension OtherImageUpload: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        func setupImagePicker() {
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
                imagePicker.sourceType = .savedPhotosAlbum
                imagePicker.delegate = self
                imagePicker.isEditing = true
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            myImageView.image = image
            self.dismiss(animated: true, completion: nil)
        }
        
     
    }
    extension OtherImageUpload {
        func uploadImage(_ image:UIImage,completion: @escaping (_ url:URL?) -> ()){
            let now = Date().__currentTimeMillis()
            let myString = String(now)
            let storageRef = Storage.storage().reference().child(myString)
            let imgData = myImageView.image?.pngData()
            let metaData = StorageMetadata()
            metaData.contentType = "image/png"
            storageRef.putData(imgData!, metadata: metaData, completion: {(metaData ,error) in
                if error == nil {
                    print("success")
                    
                    // --- alert ---
                    let alert = UIAlertController(title: "Notification",
                    message: "Upload Successful", preferredStyle: UIAlertController.Style.alert)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "MenuAdd")
                    UIApplication.shared.keyWindow?.rootViewController = vc
                    
                    // --- alert ---
                    
                    storageRef.downloadURL(completion: { (url,error) in completion(url)

                    })
                }else {
                    print("error in save image")
                    // --- alert ---
                    let alert = UIAlertController(title: "Notification",
                    message: "Upload Error", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    // --- alert ---
                    completion(nil)
                }

            })

        }
        func saveImage(name: String,profileURL:URL ,completion: @escaping ((_ url:URL?) -> ())) {
            let dict = ["title":titleText.text!,"text": detailText.text!,"price": priceText.text!,"contact": contactText.text!
                        ,"profileUrl": profileURL.absoluteString] as [String: Any]
            self.ref.child("Other").childByAutoId().setValue(dict)

        }
    }

    extension Date {
        func __currentTimeMillis() -> Int64 {
            return Int64(self.timeIntervalSince1970 * 1000)
        }
    }
