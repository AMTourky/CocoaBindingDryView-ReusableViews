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
        
        self.item = NSEntityDescription.insertNewObjectForEntityForName("Item", inManagedObjectContext: self.managedObjectContext) as! Item
        self.item?.dateProperty = NSDate()
        
        self.item!.stringProperty = "Main Item"
        self.item!.intProperty = NSNumber(integer: 99)
        
        let subItem1 = NSEntityDescription.insertNewObjectForEntityForName("SubItem", inManagedObjectContext: self.managedObjectContext) as! SubItem
        subItem1.intProperty = 1
        self.item!.addSubItem(subItem1)
        
        let subItem2 = NSEntityDescription.insertNewObjectForEntityForName("SubItem", inManagedObjectContext: self.managedObjectContext) as! SubItem
        subItem2.intProperty = 2
        self.item!.addSubItem(subItem2)
        
        let subItem3 = NSEntityDescription.insertNewObjectForEntityForName("SubItem", inManagedObjectContext: self.managedObjectContext) as! SubItem
        subItem3.intProperty = 3
        self.item!.addSubItem(subItem3)
        
        let subItem4 = NSEntityDescription.insertNewObjectForEntityForName("SubItem", inManagedObjectContext: self.managedObjectContext) as! SubItem
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

