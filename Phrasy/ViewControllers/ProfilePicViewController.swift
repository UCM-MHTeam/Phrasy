//
//  ProfilePicViewController.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/21/21.
//

import UIKit
import AlamofireImage

class ProfilePicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    var newUserInfo: [String] = []
    var newProfPic: UIImage? = nil   //This is the local profile pic to be passed onto the final view controller to create user
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageAspectScaled(toFill: size)
        
        imageView.image = scaledImage
        newProfPic = imageView.image            //This is where we update our local variable newProfPic to then be passed onto the next view controller
        
        dismiss(animated: true, completion: nil)
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
            let pic = self.newProfPic
            
            controller.newUserInfo = arr
            controller.newProfPic = pic
            // add profile pic to pass over to image viewcontroller
        }
    }
    

}
