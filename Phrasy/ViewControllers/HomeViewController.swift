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
    let refreshFriends = UIRefreshControl()
    
    var friends = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsView.dataSource = self
        friendsView.delegate = self
        refreshFriends.addTarget(self, action: #selector(loadFriends), for: .valueChanged)
        friendsView.refreshControl = refreshFriends
        
        setGradient()
        transparentNavBar()
//        self.loadFriends()
        
        let thisUser = PFUser.current()
        
        let query = PFQuery(className: "Follow")
        query.whereKey("from", equalTo: thisUser as Any)
        
        query.findObjectsInBackground { (friends, error) -> Void in
            if let friends = friends {
                self.friends = friends
                self.friendsView.reloadData()
                self.refreshFriends.endRefreshing()
            } else {
                print("Coult not load friends")
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func loadFriends() {
        let thisUser = PFUser.current()
        
        let query = PFQuery(className: "Follow")
        query.whereKey("from", equalTo: thisUser as Any)
        
        query.findObjectsInBackground { (friends, error) -> Void in
            if let friends = friends {
                self.friends = friends
                self.friendsView.reloadData()
                self.refreshFriends.endRefreshing()
            } else {
                print("Coult not load friends")
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
        } catch {}
        
        let firstName = person["firstname"] as? String
        let lastName = person["lastname"] as? String
        let lastIniital = String(lastName![lastName!.index(lastName!.startIndex, offsetBy: 0)])
        
        let profImage = person["profilePhoto"] as! PFFileObject
        let urlString = profImage.url!
        let url = URL(string: urlString)!
        
        cell.personNameLabel.text = firstName! + " " + lastIniital + "."
        cell.personImage.af.setImage(withURL: url)
        
//        var moodColor = "#C19422FF"
        
//        if(person["moodColorId"] != nil){
//            moodColor = (person["moodColorId"] as? String)!
//        }
        let moodColor = person["moodColorId"] as! String
//        print(moodColor ?? "Fail")
        
        
        // Person Cell Design
//        let cellLayer = cell.layer
        cell.contentView.layer.cornerRadius = 24
//        cellLayer.shadowColor = UIColor(hex: "#C19422FF")?.cgColor
        cell.contentView.backgroundColor = UIColor(hex: moodColor)
        
//        cellLayer.shadowOpacity = 1
//        cellLayer.shadowOffset = CGSize(width: -6.0,height: -6.0)
//        cellLayer.shadowRadius = 0.5
//        cellLayer.masksToBounds = false
//        cellLayer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        let imageView = cell.personImage.layer
        imageView.cornerRadius = 0.5 * imageView.bounds.width
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("pressed cell #\(indexPath.item)")
    }

    func transparentNavBar() {
        let navbar = self.navigationController!.navigationBar as UINavigationBar
        navbar.barTintColor = UIColor(hex: "#060606FF")
        navbar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navbar.shadowImage = UIImage()
        navbar.isTranslucent = true
        navbar.tintColor = .red
    }
    
    func setGradient() {
        gradient.frame = view.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }
}

