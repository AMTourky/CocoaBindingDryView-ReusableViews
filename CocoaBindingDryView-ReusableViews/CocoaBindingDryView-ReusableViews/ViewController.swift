//
//  ViewController.swift
//  CocoaBindingDryView-ReusableViews
//
//  Created by AMTourky on 6/25/16.
//  Copyright © 2016 AMTourky. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var mainEntity: Entity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainEntity = NSEntityDescription.insertNewObjectForEntityForName("Entity", inManagedObjectContext: self.managedObjectContext) as? Entity
        
        
        var subEntity1 = NSEntityDescription.insertNewObjectForEntityForName("SubEntity", inManagedObjectContext: self.managedObjectContext) as? SubEntity
        var subEntity2 = NSEntityDescription.insertNewObjectForEntityForName("SubEntity", inManagedObjectContext: self.managedObjectContext) as? SubEntity
        var subEntity3 = NSEntityDescription.insertNewObjectForEntityForName("SubEntity", inManagedObjectContext: self.managedObjectContext) as? SubEntity
        var subEntity4 = NSEntityDescription.insertNewObjectForEntityForName("SubEntity", inManagedObjectContext: self.managedObjectContext) as? SubEntity
        
        // Do any additional setup after loading the view.
    }
    
    var managedObjectContext: NSManagedObjectContext
    {
        return (NSApp.delegate as! AppDelegate).managedObjectContext
    }

}

