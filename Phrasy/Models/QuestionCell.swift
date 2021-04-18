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
    @IBOutlet private weak var answerView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension QuestionCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        answerView.delegate = dataSourceDelegate
        answerView.dataSource = dataSourceDelegate
        answerView.tag = row
        answerView.setContentOffset(answerView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        answerView.reloadData()
    }
}

extension PhraseEngineViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let index = collectionView.tag
        return QuestionsList[index].answers?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let questionIndex = collectionView.tag
        let answerIndex = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerChoiceCell", for: indexPath) as! AnswerChoiceCell
        
        cell.answerButton.setTitle(QuestionsList[questionIndex].answers?[answerIndex], for: .normal)
        
        cell.callback = {
            print("button pressed", indexPath)
            print(collectionView.tag)
            
            choice[questionIndex] = self.QuestionsList[questionIndex].answers?[answerIndex] ?? "default"
        }
        
        // Cell Design
        
        // Color
        switch questionIndex {
        case 0: cell.backgroundColor = UIColor(hex: "#CC5050FF")
        case 1: cell.backgroundColor = UIColor(hex: "#5089CCFF")
        case 2: cell.backgroundColor = UIColor(hex: "#826CC0FF")
        case 3: cell.backgroundColor = UIColor(hex: "#67CAA0FF")
        default: cell.backgroundColor = UIColor(hex: "#CC8B50FF")
        }
        
        cell.layer.cornerRadius = 20.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 4.0)
        cell.layer.shadowRadius = 1.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.layer.cornerRadius).cgPath
        
        
        
        
        return cell
    }
}

