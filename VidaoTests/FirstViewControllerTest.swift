//
//  FirstViewControllerTest.swift
//  Vidao
//
//  Created by davix on 4/24/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

//View 1:
//
//•The main chat view, where user can type in text and send it to the public, the message should be stored in Firebase Real-time Database.
//
//There are 4 required features:
//
//1)•The input text-view area should change its height based on the current text that the user has typed in. (maximum 8 lines)
//2)•There is a send button next to the text-view that sends the message to Firebase, after finish sending the message, the text inside the text view should be cleared and the text view should resume its original size.
//3)•After sending the text, the message list should scroll to the latest message.
//4)•Each cell in the chat list should have dynamic height based on it’s text content

//Todo Test
//
//1)Implement Auto Scroll Up
//2)Cell In Message List Should Have Dynamic Height
//3)TextView Area Should Change Its Height Bssed On The Current Text The User Has Type In

import XCTest
@testable import Vidao

class FirstViewControllerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPostMsg() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
        let nc = storyboard.instantiateInitialViewController() as? UINavigationController
        let vc : FirstViewController = FirstViewController()
        vc.setUpDatabase()
        let result = vc.postMsg(msg: "TestMessageTwo")
        XCTAssertTrue(result)
    }
    
    
}
