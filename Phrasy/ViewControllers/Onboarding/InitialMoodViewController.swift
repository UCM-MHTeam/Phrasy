//
//  InitialMoodViewController.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/21/21.
//

import UIKit
import Parse
import AlamofireImage

class InitialMoodViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var moodDictionary = [ "I'm doing great!\n\nIn the mood to chat with friends": "#6dd396ff",
          "Somewhat overwhelmed.\n\nIn need of some space for a while.": "#61B0E8ff",
          "Been thinking a lot lately\n\nWould like to vent.": "#D9C377ff",
          "I'm alright!\n\nNot much for chatting but would like some company!": "#9780EBff"]
    
//    var newUserInfo: [String] = []
    var newUserInfo: [String] = ["first", "last", "username", "password"]
    var newProfPic: UIImage? = nil
    var moodColorId = "#C19422FF"       //Default color

    @IBOutlet weak var moodView: UICollectionView!
    
    override func viewDidLoad() {
        
        moodView.delegate = self
        moodView.dataSource = self
        
        super.viewDidLoad()
        
        setGradient()
        print(" \(newUserInfo[0])  \(newUserInfo[1])  \(newUserInfo[2])  \(newUserInfo[3]) ")

        // Do any additional setup after loading the view.
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
        let friendsArray = [[PFObject]]()  //pf objects to establish friendship
        
        user["profilePhoto"] = file
        user["friends"] = friendsArray
        user.signUpInBackground{ (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                print("Error: \(error.localizedDescription)")

            } else {
                print("success!")
                self.performSegue(withIdentifier: "moodToHome", sender: nil)
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moodDictionary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = moodView.dequeueReusableCell(withReuseIdentifier: "MoodCell", for: indexPath) as! MoodCell
        
        cell.contentView.layer.cornerRadius = 24
        
        let moodColor = String(Array(moodDictionary)[indexPath.row].value)
        cell.contentView.backgroundColor = UIColor(hex: moodColor)
        
        let keyArray = Array(moodDictionary.keys)
        cell.moodLabel.text = keyArray[indexPath.row]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let mood = Array(moodDictionary)[indexPath.row]
        moodColorId = String(mood.value)
        print("Color set to \(moodColorId)")
        
    }
    
    func setGradient() {
        gradient.frame = view.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }
}
