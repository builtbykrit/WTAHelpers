//
//  UIControl+ActionBinding.swift
//  WTAHelpers
//
//  Created by Robert Thompson on 8/19/15.
//  Copyright © 2015 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

private class ActionBinding<T: UIControl>
{
    weak var control: T?
    let boundFunction: (T) -> Void
    let action: UIControlEvents
    
    init(control: T, action: UIControlEvents, boundFunction: (T) -> Void)
    {
        self.control = control
        self.boundFunction = boundFunction
        self.action = action
        
        control.addTarget(self, action: "actionHappened:", forControlEvents: action)
    }
    
    dynamic func actionHappened(sender: UIControl)
    {
        boundFunction(sender as! T)
    }
    
    deinit {
        control?.removeTarget(self, action: "actionHappened:", forControlEvents: action)
    }
}

private func createBinding<T: UIControl>(control: T, action: UIControlEvents, function: (T) -> Void) -> ActionBinding<T>
{
    return ActionBinding<T>(control: control, action: action, boundFunction: function)
}

public protocol UIControlBindable: AnyObject
{
}

public extension UIControlBindable where Self: UIControl
{
    private var bindings: [ActionBinding<Self>] {
        get {
            let bindings: [ActionBinding<Self>]? = objc_getAssociatedObject(self, &AssociatedKeys.Bindings) as? [ActionBinding<Self>]
            return bindings ?? []
        }
    }
    
    public func bindToEvent(event: UIControlEvents, boundFunc: (Self) -> Void) {
        let binding = createBinding(self, action: event, function: boundFunc)
        let bindings = self.bindings + [binding]
        objc_setAssociatedObject(self, &AssociatedKeys.Bindings, bindings, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

extension UIControl: UIControlBindable {
    private struct AssociatedKeys {
        static var Bindings = "Bindings"
    }
}
