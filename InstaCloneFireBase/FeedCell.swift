//
//  FeedCell.swift
//  InstaCloneFireBase
//
//  Created by mesut  on 27.10.2021.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {
    @IBOutlet weak var documentIdLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var userLikeLabel: UILabel!
    @IBOutlet weak var userCommentsLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func userLikeButtonClicked(_ sender: Any) {
        let fireStoreDataBase = Firestore.firestore()
        if let likecount = Int(userLikeLabel.text!){
            
            let likeStore = ["like": likecount + 1] as [String : Any]
            fireStoreDataBase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
        }
        
    }
    
}
