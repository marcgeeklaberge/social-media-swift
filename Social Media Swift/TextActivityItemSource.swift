//
//  TextActivityItemSource.swift
//  Social Media Swift
//
//  Created by Marc-Antoine Laberge on 2020-06-08.
//  Copyright © 2020 Marc-Antoine Laberge. All rights reserved.
//

import UIKit

class TextActivityItemSource: BaseActivityItemSource {
    private var defaultText: String!
    private var messageText: String?
    private var mailText: String?
    private var facebookText: String?
    private var twitterText: String?
    
    init(subjectText: String? = "", thumbnailImage: UIImage = UIImage(), defaultText: String, messageText: String? = nil, mailText: String? = nil, facebookText: String? = nil, twitterText: String? = nil) {
        super.init(subjectText: subjectText, thumbnailImage: thumbnailImage)
        self.defaultText = defaultText
        self.messageText = messageText
        self.mailText = mailText
        self.facebookText = facebookText
        self.twitterText = twitterText
    }
    
    override func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return String()
    }
    
    override func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        switch activityType {
        case .some(.message):
            return defaultText
        case .some(.mail):
            return defaultText
        case .some(.postToFacebook):
            return defaultText
        case .some(.postToTwitter):
            return defaultText
        default:
            return defaultText
        }
    }
}
