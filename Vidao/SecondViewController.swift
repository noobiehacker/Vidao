//
//  SecondViewController.swift
//  Vidao
//
//  Created by David Kwok Ho Chan on 4/21/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SecondViewController: UIViewController {

    var ref:FIRDatabaseReference!
    
    @IBAction func buttonClicked(_ sender: Any) {
        self.updateNickName(name: textInput.text!)
    }
    
    @IBOutlet weak var textInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpDatabase()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpDatabase(){
        ref = FIRDatabase.database().reference()
    }
    
    func updateNickName(name : String) -> Bool{
        var result = false
        self.ref.child("NickName").child("KiWtMq6shsBx4PWoTwK").setValue(name)
        result = true
        return result
    }
}

