//
//  Book.swift
//  GSign
//
//  Created by Nutchaya Limpalasook on 27/11/2562 BE.
//  Copyright © 2562 Seemu. All rights reserved.
//

import UIKit
import Firebase

class Book: UIViewController {
    var items = [Item]()
    var databaseRef: DatabaseReference!
   
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let databaseRef = Database.database().reference()
        databaseRef.child("Book").observe(.value, with: { (snapshot) in
              if snapshot.value != nil{
                self.items.removeAll()
                for child  in snapshot.children {
                    let item = Item()
                    let childSnapshot = child as! DataSnapshot
                    
                    if childSnapshot.hasChild("title") {
                        item.title = childSnapshot.childSnapshot(forPath: "title").value as? String
                    }
                    if childSnapshot.hasChild("contact") {
                        item.contact = childSnapshot.childSnapshot(forPath: "contact").value as? String
                                         }
                    if childSnapshot.hasChild("price") {
                        item.price = childSnapshot.childSnapshot(forPath: "price").value as? String
                    }
                    if childSnapshot.hasChild("text") {
                        item.text = childSnapshot.childSnapshot(forPath: "text").value as? String
                    }
                    if childSnapshot.hasChild("profileUrl") {
                        item.profileUrl = childSnapshot.childSnapshot(forPath: "profileUrl").value as? String
                    }
                    self.items.append(item)
                  }
                print("Here")
                self.tableView.reloadData()
              }
          })
         

        // Do any additional setup after loading the view.
    }
    
    
    
//    @IBAction func GoMenuAdd(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//               let vc = storyboard.instantiateViewController(withIdentifier: "MenuAdd")
//               UIApplication.shared.keyWindow?.rootViewController = vc
//    }
//    
//    @IBAction func GoMenuUpload(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "MenuUpload")
//        UIApplication.shared.keyWindow?.rootViewController = vc
//    }
//    
//    @IBAction func GoUser(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "UserProfile")
//        UIApplication.shared.keyWindow?.rootViewController = vc
//    }
//    

}

extension Book: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 225
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? BookTableViewCell
        let item = self.items[indexPath.row]
        let url = URL(string: item.profileUrl!)
        let data = try? Data(contentsOf: url!)
        cell?.NameText.text = item.title
        cell?.contactText.text = item.contact
        cell?.priceText.text = item.price! + " บาท"
        cell?.detailsText.text = item.text
        cell?.imgView.image = UIImage(data: data!)
        return cell!
    }
    
    
}

