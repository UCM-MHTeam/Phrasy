//
//  AnswerChoiceCell.swift
//  Phrasy
//
//  Created by Marty Nodado on 4/7/21.
//

import UIKit

class AnswerChoiceCell: UICollectionViewCell {
    
    @IBOutlet weak var answerButton: UIButton!

    @IBAction func onPressed(_ sender: Any) {
        let answer = self.answerButton.titleLabel?.text ?? "Default"
        print(answer)
        
        /*
         I got each answer to be printed in the console when the button is pressed. Now we just need to return it back to phraseLabel in the PhraseEngineViewController, save it to a var and concatenate it with phraseLabel.
         */
    }
}
