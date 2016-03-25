//
//  SecureProperty.swift
//  Pods
//
//  Created by Andras Kadar on 03/17/2016.
//  Copyright (c) 2016 Andras Kadar. All rights reserved.
//
//

import SSKeychain

private let BundleIdentifier: String = NSBundle.mainBundle().bundleIdentifier!

public class SecureProperty: NSObject {
    
    public let account: String
    public let propertyName: String
    
    public var value: String? {
        didSet {
            // If a value exists, replace it
            if let changedValue = value {
                SSKeychain.setPassword(changedValue, forService: propertyName, account: account)
            } else {
                // If it is cleared, delete from KeyChain
                SSKeychain.deletePasswordForService(propertyName, account: account)
            }
        }
    }
    
    public init(propertyName: String, account: String = BundleIdentifier) {
        self.account = account
        self.propertyName = propertyName
        
        // Try to load data from the keychain (if exists)
        do {
            let query = SSKeychainQuery()
            query.service = propertyName
            query.account = account
            try query.fetch()
            value = query.password
        } catch let error as NSError {
            print("[UM] Error loading \(propertyName): \(error.localizedDescription)")
            value = nil
        }
    }
    
}

public class SecureDataProperty: NSObject {
    
    public let account: String
    public let propertyName: String
    
    public var value: NSData? {
        didSet {
            // If a value exists, replace it
            if let changedValue = value {
                SSKeychain.setPasswordData(changedValue, forService: propertyName, account: account)
            } else {
                // If it is cleared, delete from KeyChain
                SSKeychain.deletePasswordForService(propertyName, account: account)
            }
        }
    }
    
    public init(propertyName: String, account: String = BundleIdentifier) {
        self.account = account
        self.propertyName = propertyName
        
        // Try to load data from the keychain (if exists)
        do {
            let query = SSKeychainQuery()
            query.service = propertyName
            query.account = account
            try query.fetch()
            value = query.passwordData
        } catch let error as NSError {
            print("[UM] Error loading \(propertyName): \(error.localizedDescription)")
            value = nil
        }
    }
    
}