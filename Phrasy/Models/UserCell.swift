//
//  UserCell.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/25/21.
//

import UIKit
import Parse

class UserCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    
    var userID = ""             //id to add connections b/t current and target user
    
//    let tableUser = PFObject()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func addUser(_ sender: Any) {
        let thisUser = PFUser.current()
        
        print("User attempted to add id: \(userID)")
        
        do{

//             Debug: change "ID" to a preexisting UserID in Parse
            let targetUser = try PFQuery.getUserObject(withId: userID)
            print(targetUser.username ?? "not found :(")
            print(thisUser?.username ?? "not found :(")

            let follow = PFObject(className: "Follow")
            let followback = PFObject(className: "Follow")

            follow.setObject(thisUser!, forKey: "from")
            follow.setObject(targetUser, forKey: "to")
            follow.saveInBackground()

            followback.setObject(targetUser, forKey: "from")
            followback.setObject(thisUser!, forKey: "to")
            followback.saveInBackground()
        } catch {
            print(error)
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
