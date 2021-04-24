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

//    @IBOutlet weak var imageView: UIImageView!
//
    
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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onNextButton(_ sender: Any) {
        
//        let user = PFUser()
//        user["firstname"] = firstNameField.text!
//        user["lastname"] = lastNameField.text!
//        user.username = usernameField.text
//        user.password = passwordField.text
        

    

        
        // will have to sign up after they have picked a mood
        
        
//        user.signUpInBackground { (success, error) in
//            if success {
//                self.performSegue(withIdentifier: "infoToProfilePic", sender: nil)
//            } else {
//                print("Error: \(error?.localizedDescription)")
//            }
//        }
        
    }
    
    
//    @IBAction func goHomeButton(_ sender: Any) {
//        self.performSegue(withIdentifier: "initialSeguewayToFeed", sender: nil)
//    }
//
//    @IBAction func onCameraButton(_ sender: Any) {
//        let picker = UIImagePickerController()
//        picker.delegate = self
//        picker.allowsEditing = true
//
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//            picker.sourceType = .camera
//        }else {
//            picker.sourceType = .photoLibrary
//        }
//
//        present(picker, animated: true, completion: nil)
//    }
    
//    @IBAction func onSubmitButton(_ sender: Any) {
//        var parseObject = PFObject(className: "picture")
//
//        let imageData = imageView.image!.pngData()
//        let file = PFFileObject(name: "image.png", data: imageData!)
//
//        parseObject["pofilePic"] = file
//
//        parseObject.saveInBackground{
//            (success: Bool, error: Error?) in
//            if (success){
//                print("Yay")
//            }else{
//                print("Oof")
//            }
//        }
//    }
    
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let image = info[.editedImage] as! UIImage
//        
//        let size = CGSize(width: 300, height: 300)
//        let scaledImage = image.af.imageAspectScaled(toFill: size)
//        
//        imageView.image = scaledImage
//        
//        dismiss(animated: true, completion: nil)
//    }
    

//     MARK: - Navigation
//
//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
        
        if segue.identifier == "infoToProfilePic" {
            let controller = segue.destination as! ProfilePicViewController
            
            controller.newUserInfo.append(firstNameField.text!)
            controller.newUserInfo.append(lastNameField.text!)
            controller.newUserInfo.append(usernameField.text!)
            controller.newUserInfo.append(passwordField.text!)
        }
    }
    

}
