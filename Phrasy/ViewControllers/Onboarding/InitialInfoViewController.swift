//
//  InitialInfoViewController.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/16/21.
//

import UIKit
import Parse
import AlamofireImage

class InitialInfoViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var newFirstName: String = ""
    var newLastName: String = ""
    var newUsername: String = ""
    var newPassword: String = ""
    var newMood: Int = 0 // change later
    var newProfPic: UIImage = UIImage(named: "image_placeholder")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        print("Boop")
        view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "infoToProfilePic" {
            let controller = segue.destination as! ProfilePicViewController
            
            controller.newUserInfo.append(firstNameField.text!)
            controller.newUserInfo.append(lastNameField.text!)
            controller.newUserInfo.append(usernameField.text!)
            controller.newUserInfo.append(passwordField.text!)
        }
    }
    
    func setGradient() {
        gradient.frame = view.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }
}
