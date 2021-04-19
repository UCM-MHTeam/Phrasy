//
//  HomeViewController.swift
//  Phrasy
//
//  Created by Marty Nodado on 4/14/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {

    @IBOutlet weak var friendsView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsView.dataSource = self
        friendsView.delegate = self
        
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
        
//        let logo = UIImage(named: "banner-1")
//        let imageView = UIImageView(image: logo)
//        imageView.contentMode = .scaleAspectFit
//        self.navigationItem.titleView = imageView
//        self.navigationController?.navigationBar.barTintColor = UIColor(hex: "#060606FF")
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .red
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath) as! PersonCell

        cell.personNameLabel.text = "Drake B."
        cell.personImage.image = UIImage(named: "logo")
        
        // Person Cell Design
        cell.contentView.layer.cornerRadius = 24
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
        cell.layer.shadowRadius = 10
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("pressed cell #\(indexPath.item)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor(hex: "#3673C7FF")!.cgColor,
            UIColor(hex: "#63D47CFF")!.cgColor
        ]
        gradient.startPoint = CGPoint(x: -0.5, y: -0.5)
        gradient.endPoint = CGPoint(x: 1.5, y: 1.5)
        return gradient
    }()

}

