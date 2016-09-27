//
//  DryView.swift
//  CocoaBindingDryView-ReusableViews
//
//  Created by AMTourky on 6/25/16.
//
//  Copyright © 2016 AMTourky. All rights reserved.
//  www.amtourky.me
//

import Cocoa

class DRYView: NSView {
    
    
    @IBInspectable var nibName: String?
    {
        didSet
        {
            guard let theNibName = self.nibName
            else {return}
            
            var objects: NSArray?
            NSBundle.mainBundle().loadNibNamed(theNibName, owner: self, topLevelObjects: &objects)
            if let theObjects = objects
            {
                for view in theObjects
                {
                    if let theView = view as? NSView
                    {
                        self.addSubview(theView)
                        theView.translatesAutoresizingMaskIntoConstraints = false
                        self.selfViewConstraintsToBeFollowedByView(theView)
                        break
                    }
                }
            }
        }
    }
    
    func selfViewConstraintsToBeFollowedByView(view: NSView)
    {
        let leadingConstraint   = NSLayoutConstraint(item: self, attribute: .Leading    , relatedBy: .Equal, toItem: view, attribute: .Leading  , multiplier: 1, constant: 0)
        let trailingConstraint  = NSLayoutConstraint(item: self, attribute: .Trailing   , relatedBy: .Equal, toItem: view, attribute: .Trailing , multiplier: 1, constant: 0)
        let topConstraint       = NSLayoutConstraint(item: self, attribute: .Top        , relatedBy: .Equal, toItem: view, attribute: .Top      , multiplier: 1, constant: 0)
        let bottomConstraint    = NSLayoutConstraint(item: self, attribute: .Bottom     , relatedBy: .Equal, toItem: view, attribute: .Bottom   , multiplier: 1, constant: 0)
        let widthConstraint     = NSLayoutConstraint(item: self, attribute: .Width      , relatedBy: .Equal, toItem: view, attribute: .Width    , multiplier: 1, constant: 0)
        let heightConstraint    = NSLayoutConstraint(item: self, attribute: .Height     , relatedBy: .Equal, toItem: view, attribute: .Height   , multiplier: 1, constant: 0)
        self.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint, widthConstraint, heightConstraint])
    }
    
    
    
    var inspectedObject: NSObject?
    {
        didSet
        {
            self.willChangeValueForKey("inspectedObject")
            self.didChangeValueForKey("inspectedObject")
        }
    }
    
    
    @IBOutlet var inspectedObjectControllerReference: NSObjectController?
    {
        didSet
        {
            self.inspectedObject = self.inspectedObjectControllerReference?.content as? NSObject
            self.addObserver(self, forKeyPath: "inspectedObjectControllerReference.content", options: .New, context: nil)
        }
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>)
    {
        if keyPath == "inspectedObjectControllerReference.content"
        {
            self.inspectedObject = self.inspectedObjectControllerReference?.content as? NSObject
        }
    }
    
    deinit
    {
        self.removeObserver(self, forKeyPath: "inspectedObjectControllerReference.content")
    }
}
