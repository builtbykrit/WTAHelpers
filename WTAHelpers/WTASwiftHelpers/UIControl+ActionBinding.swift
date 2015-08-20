//
//  UIControl+ActionBinding.swift
//  WTAHelpers
//
//  Created by Robert Thompson on 8/19/15.
//  Copyright © 2015 WillowTree Apps, Inc. All rights reserved.
//

import UIKit

private class ActionBinding<T: UIControl>: NSObject
{
    private weak var control: T?
    private let action: T -> Void
    private let event: UIControlEvents
    
    /**
    Create a new ActionBinding
    
    - parameter control:       The control who's action you wish to bind
    - parameter event:        The UIControlEvents you want to bind to
    - parameter action: The closure that will be executed when the above event happens
    
    - returns: The ActionBinding object
    */
    private init(control: T, event: UIControlEvents, action: T -> Void)
    {
        self.control = control
        self.action = action
        self.event = event
        
        super.init()
        
        control.addTarget(self, action: "eventHappened:", forControlEvents: event)
    }
   
    /**
    The method called when the bound action fires
    
    - parameter sender: This is sent by the system when the UIControl's action fires.
    It's defined as a UIControl here and not T because this method must be visible to Objective-C
    */
    private dynamic func eventHappened(sender: UIControl)
    {
        if let control = control
        {
            action(control)
        }
    }
    
    deinit {
        control?.removeTarget(self, action: "eventHappened:", forControlEvents: event)
    }
}

/**
This factory function is required due to a compiler bug with calling ActionBinding<Self>(…) in 
the protocol extension.

- parameter control:  The control who's action you wish to bind
- parameter action:  The UIControlEvents you want to bind to
- parameter function: The closure that will be executed when the above action happens

- returns: The ActionBinding object
*/
private func createBinding<T: UIControl>(control: T, event: UIControlEvents, action: T -> Void) -> ActionBinding<T>
{
    return ActionBinding<T>(control: control, event: event, action: action)
}

/**
    This protocol specifies the onEvent method, which is actually implemented in the private
    protocol extension
*/
public protocol UIControlActionBindable: NSObjectProtocol
{
    func onEvent(event: UIControlEvents, doAction action: Action) -> Void
}

// MARK: - UIControlActionBindable extension
public extension UIControlActionBindable where Self: UIControl
{
    private var bindings: [ActionBinding<Self>] {
        get {
            let bindings: [ActionBinding<Self>]? = objc_getAssociatedObject(self, &AssociatedKeys.Bindings) as? [ActionBinding<Self>]
            return bindings ?? []
        }
    }
    
    /// A closure which takes a parameter of type whatever this UIControl actually is
    public typealias Action = Self -> Void
    
    /**
    This method binds the provided closure to this control, fired when the given events occur
    
    - parameter event:     A mask of events you want to bind an action to
    - parameter doAction: The closure that fires when the above events occur
    */
    public func onEvent(event: UIControlEvents, doAction action: Action) {
        let binding = createBinding(self, event: event, action: action)
        let bindings = self.bindings + [binding]
        objc_setAssociatedObject(self, &AssociatedKeys.Bindings, bindings, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

/**
    Provides the static pointer that objc_setAssociatedObject and objc_getAssociatedObject need for a key.
*/
private struct AssociatedKeys {
    static var Bindings = "Bindings"
}

extension UIControl: UIControlActionBindable { }

