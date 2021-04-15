//
//  FeedViewController.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/14/21.
//

import UIKit
import Parse

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
    
}
