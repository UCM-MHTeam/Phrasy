//
//  PhraseEngineViewController.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/5/21.
//

import UIKit
import Parse

var choice: [String] = ["0","1","2","3"]

class PhraseEngineViewController: UIViewController {
    
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var formPhraseButton: UIButton!
    @IBOutlet weak var personImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let buttonView = self.formPhraseButton.layer
        let userImageView = self.personImage.layer

        buttonView.cornerRadius = 0.5 * buttonView.bounds.width
        userImageView.cornerRadius = 0.5 * userImageView.bounds.width
        
        createImageURL()
    }
    
    func createImageURL() {
        let thisUser = PFUser.current()
        let profImage = thisUser!["profilePhoto"] as! PFFileObject
        let urlString = profImage.url!
        let url = URL(string: urlString)!
        self.personImage.af.setImage(withURL: url)
    }
    
    @IBAction func formPhrase(_ sender: Any) {
        self.formPhraseLabel()
    }
    
    @objc func formPhraseLabel() {
        self.phraseLabel.text = "Hey, I'm feeling \(choice[1]) right now and I need \(choice[2]). Will you \(choice[3])?"
    }
}



extension PhraseEngineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionsList.count
    }
    
    // required for answerView in questionView cell (collection view in table view cell
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? QuestionCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
    }
    
    // required for answerView in questionView cell (collection view in table view cell
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard cell is QuestionCell else { return }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        
        cell.tag = indexPath.item
        cell.questionLabel.text = QuestionsList[indexPath.row].questionString
                
        return cell
    }
}
