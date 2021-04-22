//
//  InitialInfoViewController.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/16/21.
//

import UIKit
import Parse
import AlamofireImage

class InitialInfoViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

//    @IBOutlet weak var imageView: UIImageView!
//
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func nextPageButton(_ sender: Any) {
        self.performSegue(withIdentifier: "infoToProfilePic", sender: nil)
    }
    
}
