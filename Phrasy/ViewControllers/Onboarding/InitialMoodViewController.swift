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
    
    var moodDictionary = ["Joyful": "#6dd396ff",
                          "Relaxed": "#61B0E8ff",
                          "Confused": "#D9C377ff",
                          "Melancholy": "#9780EBff"]
    
    
    var moodColorId = "#C19422FF"       //Default color

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient()
        print(" \(newUserInfo[0])  \(newUserInfo[1])  \(newUserInfo[2])  \(newUserInfo[3]) ")

        // Do any additional setup after loading the view.
    }
    @IBAction func moodA(_ sender: Any) {
//        initialMood = "Joyful"
        moodColorId = moodDictionary["Joyful"]!
        print(moodColorId)
    }
    @IBAction func moodB(_ sender: Any) {
//        initialMood = "Relaxed"
        moodColorId = moodDictionary["Relaxed"]!
        print(moodColorId)
    }
    @IBAction func moodC(_ sender: Any) {
//        initialMood = "Confused"
        moodColorId = moodDictionary["Confused"]!
        print(moodColorId)
    }
    @IBAction func moodD(_ sender: Any) {
//        initialMood = "Melancholy"
        moodColorId = moodDictionary["Melancholy"]!
        print(moodColorId)
    }
    
    
    @IBAction func createUser(_ sender: Any) {
        let user = PFUser()
        user.username = newUserInfo[2]
        user.password = newUserInfo[3]
        user["firstname"] = newUserInfo[0]
        user["lastname"] = newUserInfo[1]
        user["moodColorId"] = moodColorId
        
        
        
        let imageData =  newProfPic?.jpegData(compressionQuality: 0.5)
        let file = PFFileObject(name: "image.png", data: imageData!)
        let friendsArray = [[PFObject]]()                           //pf objects to establish friendship
        
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
    func setGradient() {
        gradient.frame = view.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }
}
