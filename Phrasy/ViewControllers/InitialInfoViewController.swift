//
//  InitialInfoViewController.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/16/21.
//

import UIKit

class InitialInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goHomeButton(_ sender: Any) {
        self.performSegue(withIdentifier: "initialSeguewayToFeed", sender: nil)
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
