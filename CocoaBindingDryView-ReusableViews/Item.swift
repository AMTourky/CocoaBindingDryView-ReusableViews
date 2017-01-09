//
//  Entity.swift
//  CocoaBindingDryView-ReusableViews
//
//  Created by AMTourky on 9/25/16.
//  Copyright © 2016 AMTourky. All rights reserved.
//

import Foundation
import CoreData


class Item: BaseItem {

    var names: [String]
    {
        return ["Sub Item 1", "Sub Item 2", "Sub Item 3", "Sub Item 4"]
    }
    
    var values: [Int]
    {
        return [20, 40, 60, 80]
    }
    
    func addSubItem(_ subItem: SubItem)
    {
        subItem.stringProperty = self.names[self.subItems!.count % 4]
        subItem.intProperty = NSNumber(value: self.values[self.subItems!.count % 4] as Int)
        subItem.boolProperty = NSNumber(value: (self.subItems!.count % 2 == 0) as Bool)
        
        self.mutableSetValue(forKey: "subItems").add(subItem)
    }
}
