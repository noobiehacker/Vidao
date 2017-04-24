//
//  FirstViewController.swift
//  Vidao
//
//  Created by David Kwok Ho Chan on 4/21/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FirstViewController: UIViewController {

    var ref:FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func postMsg(msg : String) -> Bool{
        var result = false
        let key = self.ref.child("Messages").childByAutoId().setValue(msg)
        result = true
        return result
    }
}

