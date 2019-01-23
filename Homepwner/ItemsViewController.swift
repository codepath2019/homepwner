//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Wen Chien  Yen on 1/17/19.
//  Copyright © 2019 Wen Chien  Yen. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    // returns an integer value for the number of rows that the UITableView should display for each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return itemStore.getItemsLessThan50().count
        } else {
            return itemStore.getItemsGreaterThan50().count
        }
//        return itemStore.allItems.count
    }
    
    // returns number of sections for TableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // gives title header for each section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Team: Cheapsies"
        } else {
            return "Team: Ya Mad !?"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        print("index section: \(indexPath.section)")
        print("index row: \(indexPath.row)")
        
        //Create an instance of UITableViewCell, with default appearance
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        //instead of creating new cells, get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableView
        //let item = itemStore.allItems[indexPath.row]
        var itemAtIndexPath: Item
        if indexPath.section == 0 {
            itemAtIndexPath = itemStore.getItemsLessThan50()[indexPath.row]
        } else {
            itemAtIndexPath = itemStore.getItemsGreaterThan50()[indexPath.row]
        }
        
        cell.textLabel?.text = itemAtIndexPath.name
        cell.detailTextLabel?.text = "$\(itemAtIndexPath.valueInDollars)"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        // Create an inset based on the height of the status bar
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        // set inset for content
        tableView.contentInset = insets
        // set inset for scroll Indicator
        tableView.scrollIndicatorInsets = insets
    }
}
