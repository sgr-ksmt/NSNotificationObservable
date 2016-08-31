//
//  NSNotificationObservable.swift
//  NSNotificationObservable
//
//  Created by Suguru Kishimoto on 8/1/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

#if swift(>=3.0)
    public protocol NotificationObservable: RawRepresentable {
        var rawValue: String { get }
    }
    
    @available(*, unavailable, renamed: "NotificationObservable")
    typealias NSNotificationObservable = NotificationObservable
    
    public extension NotificationObservable {
        private var notificationName: Notification.Name {
            return Notification.Name(rawValue: self.rawValue)
        }
        public func addObserver(observer: Any, selector: Selector, object: Any? = nil) {
            NotificationCenter.default.addObserver(observer, selector: selector, name: self.notificationName, object: object)
        }
        
        public func addObserver(object: Any? = nil, queue: OperationQueue? = nil, usingBlock block: @escaping (Notification) -> Void) -> NSObjectProtocol {
            return NotificationCenter.default.addObserver(forName: self.notificationName, object: object, queue: queue, using: block)
        }
        
        public func post(object: AnyObject? = nil, userInfo: [AnyHashable: Any]? = nil) {
            NotificationCenter.default.post(name: self.notificationName, object: object, userInfo: userInfo)
        }
        
        public func removeObserver(observer: Any, object: AnyObject? = nil) {
            NotificationCenter.default.removeObserver(observer, name: self.notificationName, object: object)
        }
    }
#else
    public protocol NSNotificationObservable: RawRepresentable {
        var rawValue: String { get }
    }
    public extension NSNotificationObservable {
        public func addObserver(observer: AnyObject, selector: Selector, object: AnyObject? = nil) {
            NSNotificationCenter.defaultCenter().addObserver(observer, selector: selector, name: self.rawValue, object: object)
        }
        
        public func addObserver(object: AnyObject? = nil, queue: NSOperationQueue? = nil, usingBlock block: NSNotification -> Void) -> NSObjectProtocol {
            return NSNotificationCenter.defaultCenter().addObserverForName(self.rawValue, object: object, queue: queue, usingBlock: block)
        }
        
        
        public func post(object: AnyObject? = nil, userInfo: [NSObject: AnyObject]? = nil) {
            NSNotificationCenter.defaultCenter().postNotificationName(self.rawValue, object: object, userInfo: userInfo)
        }
        
        public func removeObserver(observer: AnyObject, object: AnyObject? = nil) {
            NSNotificationCenter.defaultCenter().removeObserver(observer, name: self.rawValue, object: object)
        }
    }
#endif

