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

//    var collectionViewOffset: CGFloat {
//        set { answerView.contentOffset.x = newValue }
//        get { return answerView.contentOffset.x }
//    }
}


