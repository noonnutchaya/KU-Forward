//
//  AddDataPage.swift
//  GSign
//
//  Created by Nutchaya Limpalasook on 26/11/2562 BE.
//  Copyright © 2562 Seemu. All rights reserved.
//
//
//import UIKit
//import FirebaseStorage
//import FirebaseFirestore
//import Kingfisher
//import TinyConstraints
//
//struct MyKey {
//    static let imagesFolder = "imagesFolder"
//    static let imagesCollection = "imagesCollection"
//    static let uid = "uid"
//    static let imageUrl = "imageUrl"
//}
//
//class AddDataPage: UIViewController {
//    @IBOutlet weak var upload: UIButton!
//
//    @IBOutlet weak var take: UIButton!
//
//    @IBOutlet weak var save: UIButton!
//
//
//
//    lazy var imagesPickerController: UIImagePickerController = {
//        let controller = UIImagePickerController()
//       controller.delegate = self
//        controller.sourceType = .camera
//        return controller
//    }()
//
//    lazy var imageView: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFill
//        iv.backgroundColor = .systemPink
//        return iv
//    }()
//
//    let activityIndicator = UIActivityIndicatorView(style: .gray)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        setupNavigationItem()
////        setupViews()
//
//    }
//
//    fileprivate func setupNavigationItem() {
//
//    }
//
//    fileprivate func setupViews() {
//        view.backgroundColor = .white
//
//        view.addSubview(imageView)
//        view.addSubview(activityIndicator)
//
//        imageView.edgesToSuperview()
//        activityIndicator.centerInSuperview()
//    }
//
//
//
//    @objc func image(_image: UIImage, didFinishSavingWithError err: Error?, contextInfo: UnsafeRawPointer) {
//        if let err = err {
//            presentAlert(title: "Warning", message: "Error")
//            print("error")
//        } else {
//            presentAlert(title: "Saved", message: "Image saved success")
//            print("success")
//        }
//    }
//
//    func presentAlert(title: String, message: String) {
//        activityIndicator.stopAnimating()
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        present(alert,animated: true)
//    }
//
//    @IBAction func add(_ sender: Any) {
//        activityIndicator.startAnimating()
//        guard  let image = imageView.image,
//            let data = image.jpegData(compressionQuality: 1.0) else {
//            presentAlert(title: "Warning", message: "Error")
//                return
//        }
//
//        let imageName = UUID().uuidString
//
//        let imageReference = Storage.storage().reference()
//                                .child(MyKey.imagesFolder).child(imageName)
//
////        imageReference.putData()
//    }
//
//    @IBAction func take(_ sender: Any) {
//        present(imagesPickerController,animated: true, completion: nil)
//    }
//
//    @IBAction func save(_ sender: Any) {
//        guard let image = imageView.image else {return}
////
////        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)),nil)
//    }
//
//}

//extension AddDataPage: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        guard let selectedImage = info[.originalImage] as? UIImage else {
//            print("not found")
//            return
//        }
//        imageView.image = selectedImage
//        imagesPickerController.dismiss(animated: true, completion: nil)
//    }
//}

import UIKit
import Firebase

@objc(DownloadViewController)
class DownloadViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    
  @IBOutlet weak var statusTextView: UITextView!
  var storageRef: StorageReference!

  override func viewDidLoad() {
    super.viewDidLoad()
    storageRef = Storage.storage().reference()

    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0]
    let filePath = "file:\(documentsDirectory)/myimage.jpg"
    guard let fileURL = URL(string: filePath) else { return }
    guard let storagePath = UserDefaults.standard.object(forKey: "storagePath") as? String else {
      return
    }

    // [START downloadimage]
    storageRef.child(storagePath).write(toFile: fileURL, completion: { (url, error) in
      if let error = error {
        print("Error downloading:\(error)")
        self.statusTextView.text = "Download Failed"
        return
      } else if let imagePath = url?.path {
        self.statusTextView.text = "Download Succeeded!"
        self.imageView.image = UIImage(contentsOfFile: imagePath)
      }
    })
    // [END downloadimage]
  }
}
