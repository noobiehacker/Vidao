//
//  FirstViewControllerTest.swift
//  Vidao
//
//  Created by davix on 4/24/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import Foundation

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