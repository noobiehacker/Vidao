//
//  FirstViewController.swift
//  Vidao
//
//  Created by David Kwok Ho Chan on 4/21/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FirstViewController: UIViewController, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource {

    var ref:FIRDatabaseReference!
    var textMessages : [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpDatabase()
        textView.delegate = self
        self.tableView.estimatedRowHeight = 70
        self.tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpDatabase(){
        ref = FIRDatabase.database().reference()
    }
    
    @IBAction func sendBtnClicked(_ sender: Any) {
        self.sendBtnAction(input: self.textView.text!)
    }
    
    func sendBtnAction(input : String){
        self.postMsg(msg: input)
        self.textMessages.append(input)
        self.textView.text = ""
        self.tableView.reloadData()
        self.scrollToBottom()
    }
    
    func postMsg(msg : String) -> Bool{
        var result = false
        self.ref.child("Message").childByAutoId().setValue(msg)
        result = true
        return result
    }
    
    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool{
        return self.getCurrentLineNumbers(textView: textView) < 9 || (text == "")
    }
    
    func expandTextView(textView: UITextView){
        textView.layoutIfNeeded()
        let height = textView.sizeThatFits(CGSize.init(width: textView.frame.size.width, height: CGFloat.greatestFiniteMagnitude)).height
        textView.contentSize.height = height
    }
    
    func getCurrentLineNumbers(textView: UITextView) -> Int{
        return Int(textView.contentSize.height / (textView.font?.lineHeight)!)
    }
    
    func textViewUpdateHeight(textView : UITextView){
        var amountOfLinesToBeShown:CGFloat = 8
        var maxHeight:CGFloat = textView.font!.lineHeight * amountOfLinesToBeShown
        let size = CGSize.init(width: textView.frame.size.width, height: maxHeight)
    }
    
    func getTextViewHeight(input : String) -> Int{
        let charactersPerLine = 100
        let heightPixelPerLine = 10
        let charCount = input.characters.count
        let lines = charCount / charactersPerLine
        return lines * heightPixelPerLine
    }
    
    //TableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.textMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.messageLabel.text = self.textMessages[indexPath.row]
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 140
    }

    func scrollToBottom(){
        
        let numberOfSections = self.tableView.numberOfSections
        let numberOfRows = self.tableView.numberOfRows(inSection: numberOfSections-1)
        
        let indexPath = IndexPath(row: numberOfRows-1 , section: numberOfSections-1)
        self.tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.middle, animated: true)
        
    }
}

