//
//  QuestionCell.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/5/21.
//

import UIKit

class QuestionCell: UITableViewCell {
    
//    var selectedButton:[Bool] = [false,false,false,false]
    var selectedButton = -1
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    @IBAction func buttonA(_ sender: Any) {
//        if(selectedButton[0] == false){
//            selectedButton[0] = true
//        }else{
//            selectedButton[0] = false
//        }
        selectedButton = 0
        print(selectedButton)
        
    }
    @IBAction func buttonB(_ sender: Any) {
//        if(selectedButton[1] == false){
//            selectedButton[1] = true
//        }else{
//            selectedButton[1] = false
//        }
        selectedButton = 1
        print(selectedButton)
    }
    @IBAction func buttonC(_ sender: Any) {
//        if(selectedButton[2] == false){
//            selectedButton[2] = true
//        }else{
//            selectedButton[2] = false
//        }
        selectedButton = 2
        print(selectedButton)
        
    }
    @IBAction func buttonD(_ sender: Any) {
//        if(selectedButton[3] == false){
//            selectedButton[3] = true
//        }else{
//            selectedButton[3] = false
//        }
        selectedButton = 3
        print(selectedButton)
    }
    
    func returnSelectedCellButton()-> Int{
        return selectedButton
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    
    

}
