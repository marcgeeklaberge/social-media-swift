//
//  ImageActivityItemSource.swift
//  Social Media Swift
//
//  Created by Marc-Antoine Laberge on 2020-06-08.
//  Copyright © 2020 Marc-Antoine Laberge. All rights reserved.
//

import UIKit

class ImageActivityItemSource: BaseActivityItemSource {
    private var defaultImage: UIImage!
    private var messageImage: UIImage?
    private var mailImage: UIImage?
    private var facebookImage: UIImage?
    private var twitterImage: UIImage?
    
    init(subjectText: String? = "", thumbnailImage: UIImage = UIImage(), defaultImage: UIImage, messageImage: UIImage? = nil, mailImage: UIImage? = nil, facebookImage: UIImage? = nil, twitterImage: UIImage? = nil) {
        super.init(subjectText: subjectText, thumbnailImage: thumbnailImage)
        self.defaultImage = defaultImage
        self.messageImage = messageImage
        self.mailImage = mailImage
        self.facebookImage = facebookImage
        self.twitterImage = twitterImage
    }
    
    override func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return UIImage()
    }
    
    override func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        switch activityType {
        case .some(.message):
            return defaultImage
        case .some(.mail):
            return defaultImage
        case .some(.postToFacebook):
            return defaultImage
        case .some(.postToTwitter):
            return defaultImage
        default:
            return defaultImage
        }
    }
}
