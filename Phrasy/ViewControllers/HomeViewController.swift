//
//  HomeViewController.swift
//  Phrasy
//
//  Created by Marty Nodado on 4/14/21.
//

import UIKit
import Parse
import AlamofireImage

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {

    @IBOutlet weak var friendsView: UICollectionView!
    
    var friends = [PFObject]()
    
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
        
        let thisUser = PFUser.current()
        
//        do {
//
//            // Debug: change "ID" to a preexisting UserID in Parse
//            let targetUser = try PFQuery.getUserObject(withId: "FjOezMSP32")
//            print(targetUser.username ?? "not found :(")
//            print(thisUser?.username ?? "not found :(")
//
//            let follow = PFObject(className: "Follow")
//            let followback = PFObject(className: "Follow")
//
//            follow.setObject(thisUser!, forKey: "from")
//            follow.setObject(targetUser, forKey: "to")
//            follow.saveInBackground()
//
//            followback.setObject(targetUser, forKey: "from")
//            followback.setObject(thisUser!, forKey: "to")
//            followback.saveInBackground()
//
//        } catch { print(error) }
        
        let query = PFQuery(className: "Follow")
        query.whereKey("from", equalTo: thisUser)
        
        query.findObjectsInBackground { (friends, error) -> Void in

            if (friends != nil) {
                self.friends = friends!
                self.friendsView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath) as! PersonCell
        
        let person = friends[indexPath.item].object(forKey: "to") as! PFUser
        do {
            try person.fetchIfNeeded()
            print(person["firstname"] ?? "nil")
        } catch {
            
        }
        
//        cell.personNameLabel.text = "Drake B."
//        cell.personImage.image = UIImage(named: "profile-avatar")
        
        let firstName = person["firstname"] as? String
        let lastName = person["lastname"] as? String
        
        let profImage = person["profilePhoto"] as! PFFileObject
        let urlString = profImage.url!
        let url = URL(string: urlString)!
//        image.getDataInBackground()
        
        cell.personNameLabel.text = firstName! + lastName!
        cell.personImage.af.setImage(withURL: url)
        
        // Person Cell Design
        cell.contentView.layer.cornerRadius = 24
        cell.layer.shadowColor = UIColor(hex: "#C19422FF")?.cgColor
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = CGSize(width: -6.0,height: -6.0)
        cell.layer.shadowRadius = 0.5
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

