//
//  LoginViewController.swift
//  Phrasy
//
//  Created by Erick Barajas on 4/7/21.
//

import UIKit
import Parse
import AlamofireImage

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient()

        self.signUpButton.layer.cornerRadius = 18
        self.signInButton.layer.cornerRadius = 18
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    func setGradient() {
        gradient.frame = view.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }
}
