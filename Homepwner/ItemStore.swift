//
//  ItemStore.swift
//  Homepwner
//
//  Created by Wen Chien  Yen on 1/17/19.
//  Copyright © 2019 Wen Chien  Yen. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    init() {
        for _ in 0..<8 {
            createItem()
        }
    }
    
    //Note: @discardableResult simply means that a caller of this function can ignore the returned value
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    // Returns a list of items with prices less than 50
    func getItemsLessThan50() -> [Item] {
        var lessThan50: [Item] = []

        var matchedItem: Item
        for i in 0...allItems.count - 1 {
            if (allItems[i].valueInDollars < 50) {
                matchedItem = allItems[i]
                lessThan50.append(matchedItem)
            }
        }
        return lessThan50
    }
    
    // Returns a list of items with prices greater than 50
    func getItemsGreaterThan50() -> [Item] {
        var greaterThan50: [Item] = []
        
        var matchedItem: Item
        for i in 0...allItems.count - 1 {
            if (allItems[i].valueInDollars > 50) {
                matchedItem = allItems[i]
                greaterThan50.append(matchedItem)
            }
        }
        return greaterThan50
    }
}
