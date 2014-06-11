//
//  NSLayoutConstraint+WTAAutoLayoutHelpers.swift
//  WTAHelpers-Swift
//
//  Created by trung on 6/11/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
   
    // Edge Constraints
    
    class func topConstraintWithView(withView: UIView, toView: UIView, offset: CGFloat = 0.0, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: withView, attribute: NSLayoutAttribute.Top, relatedBy: relation, toItem: toView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: offset)
        return constraint
    }
    
    class func leadingConstraintWithView(withView: UIView, toView: UIView, offset: CGFloat = 0.0, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: withView, attribute: NSLayoutAttribute.Leading, relatedBy: relation, toItem: toView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: offset)
        return constraint
    }
    
    class func bottomConstraintWithView(withView: UIView, toView: UIView, offset: CGFloat = 0.0, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: withView, attribute: NSLayoutAttribute.Bottom, relatedBy: relation, toItem: toView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: offset)
        return constraint
    }
    
    class func trailingConstraintWithView(withView: UIView, toView: UIView, offset: CGFloat = 0.0, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: withView, attribute: NSLayoutAttribute.Trailing, relatedBy: relation, toItem: toView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: offset)
        return constraint
    }
    
    // Adjacent Constraints
    
    class func trailingToLeadingConstraintWithTrailingView(trailingView: UIView, leadingView: UIView, offset: CGFloat, relation: NSLayoutRelation) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: trailingView, attribute: NSLayoutAttribute.Leading, relatedBy: relation, toItem: leadingView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: offset)
        return constraint
    }
    
    class func bottomToTopConstraintWithView(bottomView: UIView, topView: UIView, offset: CGFloat, relation: NSLayoutRelation) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: bottomView, attribute: NSLayoutAttribute.Top, relatedBy: relation, toItem: topView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: offset)
        return constraint
    }
    
    // Centering Constraints
    
    class func horizontallyCenterConstraintWithView(withView: UIView, toView: UIView, offset: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: withView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: toView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: offset)
        return constraint
    }
    
    class func verticallyCenterConstraintWithView(withView: UIView, toView: UIView, offset: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: withView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: toView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: offset)
        return constraint
    }
    
    // Size Constraints
    
    class func widthConstraintWithView(view: UIView, width: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: width)
        return constraint
    }
    
    class func heightConstraintWithView(view: UIView, height: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: height)
        return constraint
    }
}
