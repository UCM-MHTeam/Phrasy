//
//  SearchTableViewController.swift
//  Phrasy
//
//  Created by Erick Barajas on 4/25/21.
//

import UIKit

class SearchTableViewController:  UITableViewController, UISearchBarDelegate {
    
    let data = ["Apples", "Oranges", "Pears", "Bananas", "Plums"]
    var filteredData: [String]!

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        filteredData = data

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = filteredData[indexPath.row]
        
        return cell
    }
    
    //MARK: Search Bar Config
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        if searchText == ""{
            filteredData = data
        }
        else {
            for fruit in data{
                
                if fruit.lowercased().contains(searchText.lowercased()) {
                    
                    filteredData.append(fruit)
                }
            }
        }
        self.tableView.reloadData()
    }

}
