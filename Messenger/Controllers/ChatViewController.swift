//
//  ChatViewController.swift
//  Messenger
//
//  Created by Hamid Hoseini on 9/18/20.
//  Copyright © 2020 Hamid Hoseini. All rights reserved.
//

import UIKit
import MessageKit


struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

struct Sender: SenderType {
    var photoURL: String
    var senderId: String
    var displayName: String
}

class ChatViewController: MessagesViewController {

    private var message = [Message]()
    
    private var selfSender = Sender(photoURL: "", senderId: "1", displayName: "Mary Goli")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        message.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("Hello World Message 1")))
        message.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("Hello World Message 2")))
        
        view.backgroundColor = .red

        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
}

extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    func currentSender() -> SenderType {
        return selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return message[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return message.count
    }
    
    
}
