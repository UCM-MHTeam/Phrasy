//
//  ProfilePicViewController.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/21/21.
//

import UIKit

class ProfilePicViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    var newUserInfo: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    
//     MARK: - Navigation
//
//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
        
        if segue.identifier == "profilePicToMood" {
            let controller = segue.destination as! InitialMoodViewController
            let arr = self.newUserInfo
            
            controller.newUserInfo = arr
            // add profile pic to pass over to image viewcontroller
        }
    }
    

}
