//
//  DisclaimerViewController.swift
//  Phrasy
//
//  Created by Erick Barajas on 4/16/21.
//

import UIKit

class DisclaimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func Accept(_ sender: Any) {
        
    }
    
    @IBAction func Decline(_ sender: Any){
        UIApplication.shared.open(URL(string: "https://linktr.ee/Crayzy19")! as URL, options: [:], completionHandler: nil)
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
