//
//  SuperEntity+CoreDataProperties.swift
//  CocoaBindingDryView-ReusableViews
//
//  Created by AMTourky on 6/25/16.
//  Copyright © 2016 AMTourky. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension SuperEntity {

    @NSManaged var intProperty: NSNumber?
    @NSManaged var stringProperty: String?

}
