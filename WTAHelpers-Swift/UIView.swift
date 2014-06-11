//
//  UIView.swift
//  WTAHelpers-Swift
//
//  Created by trung on 6/11/14.
//  Copyright (c) 2014 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

extension UIView {
   
    /// Edge Constraints to Superview
    
    func addEdgeConstraintsToSuperview(inset: UIEdgeInsets) -> NSLayoutConstraint[] {
        var leadingConstraint = self.addLeadingConstraint(offset: inset.left)
        var trailingConstraint = self.addLeadingConstraint(offset: inset.left)
        var topConstraint = self.addLeadingConstraint(offset: inset.left)
        var bottomConstraint = self.addLeadingConstraint(offset: inset.left)
        return [ topConstraint, leadingConstraint, bottomConstraint, trailingConstraint ]
    }
    
    func addLeadingConstraint(toView: UIView? = nil, offset: CGFloat, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> NSLayoutConstraint {
        var view: UIView! = getSuperViewIfViewNil(toView)
        var constraint = NSLayoutConstraint.leadingConstraintWithView(self, toView: view, offset: offset, relation: relation)
        self.superview.addConstraint(constraint)
        return constraint
    }
    
    func addTrailingConstraint(toView: UIView? = nil, offset: CGFloat, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> NSLayoutConstraint {
        var view: UIView! = getSuperViewIfViewNil(toView)
        var constraint = NSLayoutConstraint.trailingConstraintWithView(self, toView: view, offset: offset, relation: relation)
        self.superview.addConstraint(constraint)
        return constraint
    }
    
    func addTopConstraint(toView: UIView? = nil, offset: CGFloat, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> NSLayoutConstraint {
        var view: UIView! = getSuperViewIfViewNil(toView)
        var constraint = NSLayoutConstraint.topConstraintWithView(self, toView: view, offset: offset, relation: relation)
        self.superview.addConstraint(constraint)
        return constraint
    }
    
    func addBottomConstraint(toView: UIView? = nil, offset: CGFloat, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> NSLayoutConstraint {
        var view: UIView! = getSuperViewIfViewNil(toView)
        var constraint = NSLayoutConstraint.bottomConstraintWithView(self, toView: view, offset: offset, relation: relation)
        self.superview.addConstraint(constraint)
        return constraint
    }
    
    /// Placing Sibling Views Adjacent to Eachother
    
    func addConstraintPlacingViewRightOfView(view: UIView, offset: CGFloat = 0.0, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint.trailingConstraintWithView(self, toView: view, offset: offset, relation: relation)
        self.superview.addConstraint(constraint)
        return constraint
    }
    
    func addConstraintPlacingViewLeftOfView(view: UIView, offset: CGFloat, relation: NSLayoutRelation) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint.trailingConstraintWithView(view, toView: self, offset: offset, relation: relation)
        self.superview.addConstraint(constraint)
        return constraint
    }
    
    func addConstraintPlacingViewAboveView(view: UIView, offset: CGFloat, relation: NSLayoutRelation) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint.bottomToTopConstraintWithView(self, topView: view, offset: offset, relation: relation)
        self.superview.addConstraint(constraint)
        return constraint
    }
    
    func addConstraintPlacingViewBelowView(view: UIView, offset: CGFloat, relation: NSLayoutRelation) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint.bottomToTopConstraintWithView(view, topView: self, offset: offset, relation: relation)
        self.superview.addConstraint(constraint)
        return constraint
    }

    /// Centering Constraints
    
    func addCenteringConstraintToSuperview(view: UIView? = nil, offset: CGPoint) -> NSLayoutConstraint[] {
        var verticalContraint = self.addVerticallyCenterConstraintToView(toView: view, offset: offset.y)
        var horizontalContraint = self.addHorizontallyCenterConstraintToView(toView: view, offset: offset.x)
        return [horizontalContraint, verticalContraint]
    }
    
    func addVerticallyCenterConstraintToView(toView: UIView? = nil, offset: CGFloat) -> NSLayoutConstraint {
        var view: UIView! = getSuperViewIfViewNil(toView)
        var constraint = NSLayoutConstraint.verticallyCenterConstraintWithView(self, toView: view, offset: offset)
        self.superview.addConstraint(constraint)
        return constraint
    }
    
    func addHorizontallyCenterConstraintToView(toView: UIView? = nil, offset: CGFloat) -> NSLayoutConstraint {
        var view: UIView! = getSuperViewIfViewNil(toView)
        var constraint = NSLayoutConstraint.horizontallyCenterConstraintWithView(self, toView: view, offset: offset)
        self.superview.addConstraint(constraint)
        return constraint
    }
    
    /// Size Constraints
    
    func addSizeConstraints(size: CGSize) -> NSLayoutConstraint[] {
        var heightConstraint = self.addHeightConstraint(size.height)
        var widthConstraint = self.addWidthConstraint(size.width)
        return [ widthConstraint, heightConstraint ]
    }
    
    func addHeightConstraint(height: CGFloat) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint.heightConstraintWithView(self, height: height)
        return constraint
    }
    
    func addWidthConstraint(width: CGFloat) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint.widthConstraintWithView(self, width: width)
        return constraint
    }
    
    // Private Helpers
    
    func getSuperViewIfViewNil(checkView: UIView?) -> UIView! {
        
        var view: UIView! = nil
        
        if checkView == nil {
            view = self.superview
        } else {
            view = checkView
        }
        
        return view
    }

}
