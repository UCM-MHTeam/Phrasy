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

class PhraseEngineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
        

    var storedOffsets = [Int: CGFloat]()

    
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let QuestionsList: [Question] = [
        Question(questionString: "What did they ask you?",
                 answers: ["How are you feeling?", "How ya doing?"]),
        Question(questionString: "What best descrives what you're feeling now?",
                 answers: ["Anxious","Unhappy","Exhausted","Angry","Worried","Afraid","Pessimistic","Uncomfortable","Disappointed","Confused","Frustrated"]),
        Question(questionString: "What do you need right now?",
                 answers: ["some alone time", " someone to vent to", "some company", "to make a decision", "to take action on something"]),
        Question(questionString: "What role can they play for you?", answers: ["give me some space", "listen to me", "accompany me for a while", "provide some input", "refer me to someone that can help"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func formPhrase(_ sender: Any) {
        self.formPhraseLabel()
    }
    
    
    @objc func formPhraseLabel() {
        let choice = ["sad", "some company", "be able to call me later today?"]
//        let choice: [String]
        
        
        
        self.phraseLabel.text = "Hey, I'm feeling \(choice[0]) right now and I need \(choice[1]). Will you \(choice[2])?"
    }
    
    
    
    func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionsList.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? QuestionCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {

//        guard cell is QuestionCell else { return }
        guard let tableViewCell = cell as? QuestionCell else { return }

        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset

    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        print(indexPath.row)
        
//        cell.questionLabel.text = questionArr[indexPath.row]
        cell.tag = indexPath.item
        cell.questionLabel.text = QuestionsList[indexPath.row].questionString
    
        
        
        
                
        return cell

    }
}
