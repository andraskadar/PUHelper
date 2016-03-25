//
//  ViewController.swift
//  PUHelper
//
//  Created by Andras Kadar on 03/25/2016.
//  Copyright (c) 2016 Andras Kadar. All rights reserved.
//

import UIKit

import PUHelper
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var textFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveClicked(button: AnyObject) {
        if let text = textFiled.text {
            textFiled.text = nil
            DALHelper.writeInRealm(block: { (realm) in
                let object = StoredObject()
                object.title = text
                realm.add(object)
            })
        }
    }
    
}

class StoredObject: Object {
    
    dynamic var id: String = NSUUID().UUIDString
    dynamic var title: String = ""
    
}

