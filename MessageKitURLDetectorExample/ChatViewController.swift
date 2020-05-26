//
//  ChatViewController.swift
//  MessageKitURLDetectorExample
//
//  Created by Kino Roy on 2020-05-26.
//  Copyright © 2020 Kino Roy. All rights reserved.
//

import Foundation
import MessageKit

struct Message: MessageType {
    var sender: SenderType
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKind
}


class ChatViewController: MessagesViewController {
    lazy var text: NSMutableAttributedString = {
        let text = NSMutableAttributedString(string: "Check out this cool link")
        text.addAttribute(.link, value: URL(string: "https://github.com/MessageKit/MessageKit"), range: NSRange(location: 0, length: text.string.count))
        return text
    }()
    lazy var messages = [
        Message(
            sender: Sender(senderId: "test", displayName: "Test"),
            messageId: "1",
            sentDate: Date(),
            kind: .attributedText(text)
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messageCellDelegate = self
    }
}

extension ChatViewController: MessagesLayoutDelegate {
    
}

extension ChatViewController: MessagesDataSource {
    func currentSender() -> SenderType {
        return Sender(senderId: "test", displayName: "Test")
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
}

extension ChatViewController: MessagesDisplayDelegate {
    func enabledDetectors(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> [DetectorType] {
        return [.url]
    }
}

extension ChatViewController: MessageCellDelegate {
    func didTapMessage(in cell: MessageCollectionViewCell) {
        print("Tapped message")
    }
    func didSelectURL(_ url: URL) {
        print("Selected URL \(url.absoluteString)")
    }
}
