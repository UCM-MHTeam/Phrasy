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
        return cell
    }
}

