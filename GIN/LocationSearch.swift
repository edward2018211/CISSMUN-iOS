//
//  LocationSearch.swift
//  CISSMUN
//
//  Created by Tanya Lai on 9/3/17.
//  Copyright © 2017 Stanley Liu. All rights reserved.
//

import UIKit

var array = ["H316/H318, Wittenberg Hall", "PC Lounge","H015A, PE Commons", "H115, HS Gym", "P228, Phoenix Café",  "H227, HS Library", "H233, HS Conference Room", "H329, Business Hub Conference Room", "H405/H406, Augsburg Hall", "P106, PC Gym", "M116, MS Gym", "E111, ES Motor Skills Room", "E322, ES Library", "E122, ES Cafeteria", "R302, Orchestra Room", "PC Commons", "H116, Old Luther", "P230/P231, Jade/Pearl", "P202", "R110, Drama Room", "H117, Makerspace", "H127, Health Room", "R101, Rittman Theatre", "Room #, Costume Room", "MSR?????", "H404", "H403", "P201, New Luther", "H305", "H205", "P106, Phoenix Center Gym", "Classroom next to Jade/Pearl???", "H203", "H204", "H206", "MS and HS classrooms Schools???"
]

var images = [#imageLiteral(resourceName: "Wittenberg Hall"), #imageLiteral(resourceName: "PC Lounge")]

var row = 0

class LocationSearch: UITableViewController, UISearchResultsUpdating{

    
    
    
    var filtered = [String]()
    var searchController : UISearchController!
    var resultsController = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: resultsController)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        resultsController.tableView.dataSource = self
        resultsController.tableView.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false
        //searchController.searchBar.barTintColor = UIColor.black
    }

        
    
    func updateSearchResults(for searchController: UISearchController) {
        filtered = array.filter{ (array:String) -> Bool in
            
            if array.lowercased().contains(self.searchController.searchBar.text!.lowercased()){
                return true
            } else {
                return false
            }
        }
        resultsController.tableView.reloadData()
    }
    
    
    
    // MARK: - Table view data source
        override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if tableView == resultsController.tableView{
            return filtered.count
        }
        else {
            return array.count
        }
 
    }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if tableView == resultsController.tableView{
             let cell = UITableViewCell()
            cell.textLabel?.text = filtered[indexPath.row]
            return cell
        }
        else {
             let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
            cell.textLabel?.text = array[indexPath.row]
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
    }
    /*
    func tableView(_ tableView: UITableView, didSelectRow indexPath: IndexPath) {
        
    }
    */
}
