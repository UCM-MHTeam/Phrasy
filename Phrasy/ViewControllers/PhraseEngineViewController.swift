//
//  PhraseEngineViewController.swift
//  Phrasy
//
//  Created by Jonathan Ballona Sanchez on 4/5/21.
//

import UIKit

class PhraseEngineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
        

    let model: [[UIColor]] = generateRandomData()

    
    @IBOutlet weak var tableView: UITableView!
    
    let questionArr:[String] = ["What did they ask you?","What best describes what you’re feeling now?", "more text", "more text", "hello there"]
   
    let buttonStatements:[[String]] = [
        ["How are you feeling?","Another question", "More", "More Text"],
        ["Anxious","Angry", "Worried", "Confused"],
        ["some alone time", "some company", "to make a decision", "To take action on something"],
        ["Give me space", "Listen to me", "Accompany me for a while", "Provide some input"]
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        



        // Do any additional setup after loading the view.
    }
    
    func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? QuestionCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        
//        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        guard cell is QuestionCell else { return }

//        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        print(indexPath.row)
//        print(counter)
        
        cell.questionLabel.text = questionArr[indexPath.row]
        
        
        
//        for n in 0...3 {
//            if(n == 0){
//                cell.buttonA.setTitle(buttonStatements[indexPath.row][n], for: .normal)
////                print(cell.buttonA.titleLabel!)
//            }else if(n == 1){
//                cell.buttonB.setTitle(buttonStatements[indexPath.row][n], for: .normal)
////                print(cell.buttonB.titleLabel!)
//            }else if(n == 2){
//                cell.buttonC.setTitle(buttonStatements[indexPath.row][n], for: .normal)
////                print(cell.buttonC.titleLabel!)
//            }else{
//                cell.buttonD.setTitle(buttonStatements[indexPath.row][n], for: .normal)
////                print(cell.buttonD.titleLabel!)
//            }
//            print(cell.buttonA.titleLabel!)
//            print(cell.buttonB.titleLabel!)
//            print(cell.buttonC.titleLabel!)
//            print(cell.buttonD.titleLabel!)
//        }
                
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

}

extension PhraseEngineViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return model[collectionView.tag].count
    }
    
//    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        collectionView.register
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerChoiceCell", for: indexPath)
//                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell",
//                    forIndexPath: indexPath)
        
                cell.backgroundColor = model[collectionView.tag][indexPath.item]
        
                return cell
        }
}

func generateRandomData() -> [[UIColor]] {
    let numberOfRows = 20
    let numberOfItemsPerRow = 8

    return (0..<numberOfRows).map { _ in
        return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
    }
}

extension UIColor {
    
    class func randomColor() -> UIColor {

        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100

        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}
