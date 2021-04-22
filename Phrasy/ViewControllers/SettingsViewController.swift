//
//  SettingsViewController.swift
//  Phrasy
//
//  Created by Marty Nodado on 4/14/21.
//

import UIKit
import Parse
import AlamofireImage

class SettingsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadImage()

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
    
    
    func loadImage(){
        let user = PFUser.current()
        
//        let file = user?["profilePhoto"] as! PFFileObject
//        file.getDataInBackground()
//        imageView.image = UIImage(data: file as! String)
//        self.imageView.image = UIImage(named: (user?["profilePhoto"]) as! String)
        
        let file = user?["profilePhoto"] as? PFFileObject
        
        file?.getDataInBackground{ (imageData: Data?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            }else if let imageData = imageData{
                let image = UIImage(data: imageData)
                self.imageView.image = image
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
