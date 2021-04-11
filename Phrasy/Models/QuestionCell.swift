//
//  QuestionCell.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/5/21.
//

import UIKit

//let model: [[UIColor]] = generateRandomData()

class QuestionCell: UITableViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet private weak var answerView: UICollectionView!

    
//    @IBAction func isPressed(_ sender: Any) {
//        print(Quest)
//    }
    
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

    var collectionViewOffset: CGFloat {
        set { answerView.contentOffset.x = newValue }
        get { return answerView.contentOffset.x }
    }
    
    
}

extension PhraseEngineViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

//        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell") as! QuestionCell

        let index = collectionView.tag
        return QuestionsList[index].answers?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        
        let questionIndex = collectionView.tag
        let answerIndex = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerChoiceCell", for: indexPath) as! AnswerChoiceCell
        
        cell.answerButton.setTitle(QuestionsList[questionIndex].answers?[answerIndex], for: .normal)
        
       
        
        return cell
        }
}

//func generateRandomData() -> [[UIColor]] {
//    let numberOfRows = 20
//    let numberOfItemsPerRow = PhraseEngineViewController.
//
//    return (0..<numberOfRows).map { _ in
//        return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
//    }
//}
//
//extension UIColor {
//
//    class func randomColor() -> UIColor {
//
//        let hue = CGFloat(arc4random() % 100) / 100
//        let saturation = CGFloat(arc4random() % 100) / 100
//        let brightness = CGFloat(arc4random() % 100) / 100
//
//        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
//    }
//}
