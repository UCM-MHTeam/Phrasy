//
//  SettingsViewController.swift
//  Phrasy
//
//  Created by Marty Nodado on 4/14/21.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOutInBackground(block: { (error) in
            if let error = error {
                print(error.localizedDescription)
            }else {
                print("Success logout")
                let main = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
                let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
                sceneDelegate.window?.rootViewController = loginViewController
            }
        })
    }
    
    func setGradient() {
        gradient.frame = view.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }
}
