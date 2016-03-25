//
//  AppDelegate.swift
//  PUHelper
//
//  Created by Andras Kadar on 03/25/2016.
//  Copyright (c) 2016 Andras Kadar. All rights reserved.
//

import UIKit

import PUHelper

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        DALHelper.configure(true)
        
        return true
    }

}

