//
//  PhraseEngineViewController.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/5/21.
//

import UIKit

struct Question {
    var questionString: String?
    var answers: [String]?
}

var choice: [String] = ["0","1","2","3"]

class PhraseEngineViewController: UIViewController {
    
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var formPhraseButton: UIButton!
    
    let QuestionsList: [Question] = [
        Question(questionString: "What did they ask you?",
                 answers: ["How are you feeling?", "What do you need right now?", "Is there anything I can do for you?"]),
        Question(questionString: "What best describes what you're feeling now?",
                 answers: ["anxious","unhappy","exhausted","angry","worried","afraid","pessimistic","uncomfortable","disappointed","confused","frustrated"]),
        Question(questionString: "What do you need right now?",
                 answers: ["some alone time", "someone to vent to", "some company", "to make a decision", "to take action on something"]),
        Question(questionString: "What role can they play for you?", answers: ["give me some space", "listen to me", "accompany me for a while", "provide some input", "refer me to someone that can help"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let buttonView = self.formPhraseButton.layer
        buttonView.cornerRadius = 0.5 * buttonView.bounds.width
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
