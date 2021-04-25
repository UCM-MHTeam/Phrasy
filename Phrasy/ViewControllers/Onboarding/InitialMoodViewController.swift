//
//  InitialMoodViewController.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/21/21.
//

import UIKit
import Parse
import AlamofireImage

class InitialMoodViewController: UIViewController {

    var newUserInfo: [String] = []
    var newProfPic: UIImage? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        print(" \(newUserInfo[0])  \(newUserInfo[1])  \(newUserInfo[2])  \(newUserInfo[3]) ")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createUser(_ sender: Any) {
        let user = PFUser()
        user.username = newUserInfo[2]
        user.password = newUserInfo[3]
        user["firstname"] = newUserInfo[0]
        user["lastname"] = newUserInfo[1]
        
        
        
        let imageData =  newProfPic?.jpegData(compressionQuality: 0.5)
        let file = PFFileObject(name: "image.png", data: imageData!)
        let friendsArray = [[PFObject]]()
        
        user["profilePhoto"] = file
        user["friends"] = friendsArray
        user.signUpInBackground{ (success, error) in
            if success{
                self.performSegue(withIdentifier: "initialMoodToHome", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
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
