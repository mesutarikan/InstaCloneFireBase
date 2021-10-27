//
//  FeedViewController.swift
//  InstaCloneFireBase
//
//  Created by mesut  on 26.10.2021.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var userEmailArray = [String]()
    var userCommentsArray = [String]()
    var userLikeArray = [Int]()
    var userImageViewArray = [String]()
    var userDocumentIdArray = [String]()
    
    
 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromFireStore()
        
        
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        as! FeedCell
        cell.userEmailLabel.text = userEmailArray[indexPath.row]
        cell.userCommentsLabel.text = userCommentsArray[indexPath.row]
        cell.userLikeLabel.text = String(userLikeArray[indexPath.row])
        cell.userImageView.sd_setImage(with: URL(string: self.userImageViewArray[indexPath.row]))
        cell.documentIdLabel.text = userDocumentIdArray[indexPath.row]
        
        return cell 
    }
    
    
    func getDataFromFireStore(){
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error12")
            }else{
                if snapshot?.isEmpty != true && snapshot != nil{
                    self.userEmailArray.removeAll(keepingCapacity: false)
                     self.userCommentsArray.removeAll(keepingCapacity: false)
                     self.userLikeArray.removeAll(keepingCapacity: false)
                     self.userImageViewArray.removeAll(keepingCapacity: false)
                    self.userDocumentIdArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents{
                        let dokumentID = document.documentID
                        self.userDocumentIdArray.append(dokumentID)
                        if let postedBy = document.get("postedBy") as? String{
                            self.userEmailArray.append(postedBy)
                        }
                        if let postComment = document.get("postComment") as? String{
                            self.userCommentsArray.append(postComment)
                        }
                        if let like = document.get("like") as? Int{
                            self.userLikeArray.append(like)
                        }
                        if let imageUrl = document.get("imageUrl") as? String{
                            self.userImageViewArray.append(imageUrl)
                        }
                        
                    }
                    self.tableView.reloadData()
                    
                }
            }
            
                
            
              
                    
                   /*
                    
                        
                        
                        
                        */
                    }
                    
                }
            }
        
    

    

    


