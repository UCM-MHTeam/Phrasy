//
//  AnswerChoiceCell.swift
//  Phrasy
//
//  Created by Marty Nodado on 4/7/21.
//

import UIKit

class AnswerChoiceCell: UICollectionViewCell {
    
    @IBOutlet weak var answerButton: UIButton!
    
    class var identifier: String{
        return String(describing: self)
    }
    class var nib: UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    var callback : (()->Void)?

    @IBAction func answerSelected(_ sender: UIButton!) {
        callback?()
    }
}
