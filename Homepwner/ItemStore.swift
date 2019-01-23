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
        for _ in 0..<5 {
            createItem()
        }
    }
    
    //Note: @discardableResult simply means that a caller of this function can ignore the returned value
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
}
