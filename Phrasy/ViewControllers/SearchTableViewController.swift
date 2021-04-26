//
//  SearchTableViewController.swift
//  Phrasy
//
//  Created by Erick Barajas on 4/25/21.
//

import UIKit
import Parse

class SearchTableViewController:  UITableViewController, UISearchBarDelegate {
    
    let data = ["Apples", "Oranges", "Pears", "Bananas", "Plums"]
    var filteredData: [String]!

    var dataUsers = [PFObject]()
    var filteredUsers = [PFObject]()

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className: "_User")
        
        query.findObjectsInBackground { (users, error) -> Void in
            if users != nil{
                self.dataUsers = users!
                self.filteredUsers = self.dataUsers
                self.tableView.reloadData()         //keep?
                
            }else{
                print("failure to retreive data")
            }
        }
        
        searchBar.delegate = self
        filteredUsers = dataUsers

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return filteredData.count
        return filteredUsers.count
//        return dataUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
//        print("Data users: \(dataUsers.count)")
//        print("Filtered users: \(filteredUsers.count)")
//        let person = dataUsers[indexPath.row] as! PFUser
        
//        cell.textLabel?.text = person["username"] as? String
//        cell.textLabel?.text = filteredData[indexPath.row]
        
//        let person = dataUsers[indexPath.row] as! PFUser
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell")! as! UserCell
//        cell.userName.text = person["username"] as? String
        print("Hi")
        print("Filtered users: \(filteredUsers.count)")
        let person = filteredUsers[indexPath.row] as! PFUser
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell")! as! UserCell
        cell.userName.text = person["username"] as? String
        cell.userID = person.objectId!
        
        return cell
    }
    
    //MARK: Search Bar Config
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        filteredUsers = []
        
        if searchText == ""{
            filteredData = data
            filteredUsers = dataUsers
        }
        else {
            for fruit in data{
                
                
                if fruit.lowercased().contains(searchText.lowercased()) {
                    
                    filteredData.append(fruit)
                }
            }
            for members in dataUsers{
                let name = members["username"] as? String
                if name!.lowercased().contains(searchText.lowercased()){
                    filteredUsers.append(members)
                }
            }
            
        }
        self.tableView.reloadData()
    }

}
