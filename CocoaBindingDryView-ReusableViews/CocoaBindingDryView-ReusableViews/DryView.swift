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

@IBDesignable class DRYView: NSView {
    
    
    @IBInspectable var nibName: String?
    {
        didSet
        {
            guard let theNibName = self.nibName
            else {return}
            
            var objects: NSArray? = NSArray()
            self.bundle?.loadNibNamed(theNibName, owner: self, topLevelObjects: &objects!)
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
    
    lazy var bundle: Bundle? =
    {
        guard let theNibName = self.nibName
        else {return nil}
        
        var objects: NSArray? = NSArray()
        var isLoaded = Bundle.main.loadNibNamed(theNibName, owner: self, topLevelObjects: &objects!)
        if isLoaded
        {
            return Bundle.main
        }
        else
        {
            return Bundle(for: self.classForCoder)
        }
    }()
    
    func selfViewConstraintsToBeFollowedByView(_ view: NSView)
    {
        let leadingConstraint   = NSLayoutConstraint(item: self, attribute: .leading    , relatedBy: .equal, toItem: view, attribute: .leading  , multiplier: 1, constant: 0)
        let trailingConstraint  = NSLayoutConstraint(item: self, attribute: .trailing   , relatedBy: .equal, toItem: view, attribute: .trailing , multiplier: 1, constant: 0)
        let topConstraint       = NSLayoutConstraint(item: self, attribute: .top        , relatedBy: .equal, toItem: view, attribute: .top      , multiplier: 1, constant: 0)
        let bottomConstraint    = NSLayoutConstraint(item: self, attribute: .bottom     , relatedBy: .equal, toItem: view, attribute: .bottom   , multiplier: 1, constant: 0)
        let widthConstraint     = NSLayoutConstraint(item: self, attribute: .width      , relatedBy: .equal, toItem: view, attribute: .width    , multiplier: 1, constant: 0)
        let heightConstraint    = NSLayoutConstraint(item: self, attribute: .height     , relatedBy: .equal, toItem: view, attribute: .height   , multiplier: 1, constant: 0)
        self.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint, widthConstraint, heightConstraint])
    }
    
    
    
    var inspectedObject: NSObject?
    {
        didSet
        {
            self.willChangeValue(forKey: "inspectedObject")
            self.didChangeValue(forKey: "inspectedObject")
        }
    }
    
    
    @IBOutlet var inspectedObjectControllerReference: NSObjectController?
    {
        didSet
        {
            self.inspectedObject = self.inspectedObjectControllerReference?.content as? NSObject
            self.addObserver(self, forKeyPath: "inspectedObjectControllerReference.content", options: .new, context: nil)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
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
