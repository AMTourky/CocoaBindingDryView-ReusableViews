//
//  BaseItem+CoreDataProperties.swift
//  CocoaBindingDryView-ReusableViews
//
//  Created by AMTourky on 9/25/16.
//  Copyright © 2016 AMTourky. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension BaseItem {

    @NSManaged var intProperty: NSNumber?
    @NSManaged var stringProperty: String?

}
