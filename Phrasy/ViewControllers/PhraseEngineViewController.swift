//
//  PhraseEngineViewController.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/5/21.
//

import UIKit

class PhraseEngineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var questionCells:[QuestionCell] = [];

    @IBOutlet weak var phraseLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let questionArr:[String] = ["What did they ask you?","What best describes what you’re feeling now?", "more text", "more text", "hello there"]
   
    @IBAction func formPhrase(_ sender: Any) {
        self.formPhraseLabel()
    }
    
    let buttonStatements:[[String]] = [
        ["A", "B", "C", "D"],
        ["E", "F", "G", "H"],
        ["I", "J", "K", "L"],
        ["M", "N", "O", "P"]
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.formPhraseLabel()
        self.reloadInputViews()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        
        cell.questionLabel.text = questionArr[indexPath.row] as? String
        
        for n in 0...3 {
            if(n == 0){
                cell.buttonA.setTitle(buttonStatements[indexPath.row][n], for: .normal)
            }else if(n == 1){
                cell.buttonB.setTitle(buttonStatements[indexPath.row][n], for: .normal)
            }else if(n == 2){
                cell.buttonC.setTitle(buttonStatements[indexPath.row][n], for: .normal)
            }else{
                cell.buttonD.setTitle(buttonStatements[indexPath.row][n], for: .normal)
            }
        }
        
        questionCells.append(cell)
        
        return cell

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func formPhraseLabel(){
        //Hey <person>, I’m feeling (2) right now, and I need (3). Will you (4)?
        var phraseBones:[String] = ["Hey ", "___",", I'm feeling ", "___"," right now, and I need ", "___", ". Will you ", "___", "?"]
        
        var sentence = ""
        var chosenButtons:[String] = ["default", "default", "default", "default"]
        for n in 0...3{
            if(questionCells[n].returnSelectedCellButton() != -1){
                if(questionCells[n].returnSelectedCellButton() == 0){
                    chosenButtons[n] = (questionCells[n].buttonA.titleLabel?.text)!
                }
                if(questionCells[n].returnSelectedCellButton() == 1){
                    chosenButtons[n] = (questionCells[n].buttonB.titleLabel?.text)!
                }
                if(questionCells[n].returnSelectedCellButton() == 2){
                    chosenButtons[n] = (questionCells[n].buttonC.titleLabel?.text)!
                }
                if(questionCells[n].returnSelectedCellButton() == 3){
                    chosenButtons[n] = (questionCells[n].buttonD.titleLabel?.text)!
                }
            
        }
        
            if(chosenButtons[0] != "default"){
                phraseBones[1] = chosenButtons[0]
            }
            if(chosenButtons[1] != "default"){
                phraseBones[3] = chosenButtons[1]
            }
            if(chosenButtons[2] != "default"){
                phraseBones[5] = chosenButtons[2]
            }
            if(chosenButtons[3] != "default"){
                phraseBones[7] = chosenButtons[3]
            }
        }
        
        
        for m in 0...(phraseBones.count-1){
            sentence += phraseBones[m]
        }
        print(sentence)
        
        phraseLabel.text = sentence as? String
        
        
    }

}
