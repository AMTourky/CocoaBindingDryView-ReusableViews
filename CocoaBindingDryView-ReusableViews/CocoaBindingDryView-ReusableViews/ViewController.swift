//
//  ViewController.swift
//  CocoaBindingDryView-ReusableViews
//
//  Created by AMTourky on 6/25/16.
//  Copyright © 2016 AMTourky. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    dynamic var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: self.managedObjectContext) as! Item
        self.item?.dateProperty = Date()
        
        self.item!.stringProperty = "Main Item"
        self.item!.intProperty = NSNumber(value: 99 as Int)
        
        let subItem1 = NSEntityDescription.insertNewObject(forEntityName: "SubItem", into: self.managedObjectContext) as! SubItem
        subItem1.intProperty = 1
        self.item!.addSubItem(subItem1)
        
        let subItem2 = NSEntityDescription.insertNewObject(forEntityName: "SubItem", into: self.managedObjectContext) as! SubItem
        subItem2.intProperty = 2
        self.item!.addSubItem(subItem2)
        
        let subItem3 = NSEntityDescription.insertNewObject(forEntityName: "SubItem", into: self.managedObjectContext) as! SubItem
        subItem3.intProperty = 3
        self.item!.addSubItem(subItem3)
        
        let subItem4 = NSEntityDescription.insertNewObject(forEntityName: "SubItem", into: self.managedObjectContext) as! SubItem
        subItem4.intProperty = 4
        self.item!.addSubItem(subItem4)
        
//        self.willChangeValueForKey("Item")
//        self.didChangeValueForKey("Item")
        
    }
    
    var managedObjectContext: NSManagedObjectContext
    {
        return (NSApp.delegate as! AppDelegate).managedObjectContext
    }

}

