////
////  ShowDataViewController.swift
////  kuforward
////
////  Created by cnk_faang on 27/11/2562 BE.
////  Copyright © 2562 cnk_faang. All rights reserved.
////
//
//import UIKit
//import Firebase
//
//class ShowDataViewController: UIViewController {
//    var items = [Item]()
//    //var databaseRef: DatabaseReference!
//    @IBOutlet weak var tableView: UITableView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let databaseRef = Database.database().reference()
//        databaseRef.child("chat").observe(.value, with: { (snapshot) in
//              if snapshot.value != nil{
//                self.items.removeAll()
//                for child  in snapshot.children {
//                    let item = Item()
//                    let childSnapshot = child as! DataSnapshot
//                    
//                    if childSnapshot.hasChild("title") {
//                        item.title = childSnapshot.childSnapshot(forPath: "title").value as? String
//                    }
//                    if childSnapshot.hasChild("contact") {
//                        item.contact = childSnapshot.childSnapshot(forPath: "contact").value as? String
//                                         }
//                    if childSnapshot.hasChild("price") {
//                        item.price = childSnapshot.childSnapshot(forPath: "price").value as? String
//                    }
//                    if childSnapshot.hasChild("text") {
//                        item.text = childSnapshot.childSnapshot(forPath: "text").value as? String
//                    }
//                    if childSnapshot.hasChild("profileUrl") {
//                        item.profileUrl = childSnapshot.childSnapshot(forPath: "profileUrl").value as? String
//                    }
//                    self.items.append(item)
//                  }
//                print("Here")
//                self.tableView.reloadData()
//              }
//          })
//         
//
//        // Do any additional setup after loading the view.
//    }
//    
//    
//
//}
//extension ShowDataViewController: UITableViewDelegate,UITableViewDataSource{
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//       return 450
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.items.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as? FeedTableViewCell
//        let item = self.items[indexPath.row]
//        let url = URL(string: item.profileUrl!)
//        let data = try? Data(contentsOf: url!)
//        cell?.nameView.text = item.title
//        cell?.contactView.text = item.contact
//        cell?.priceView.text = item.price
//        cell?.detailsView.text = item.text
//        cell?.imgView.image = UIImage(data: data!)
//        return cell!
//    }
//    
//    
//}
