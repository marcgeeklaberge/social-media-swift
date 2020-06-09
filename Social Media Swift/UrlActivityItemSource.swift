//
//  UrlActivityItemSource.swift
//  Social Media Swift
//
//  Created by Marc-Antoine Laberge on 2020-06-08.
//  Copyright © 2020 Marc-Antoine Laberge. All rights reserved.
//

import UIKit
import LinkPresentation

class UrlActivityItemSource: BaseActivityItemSource {
    private var title: String!
    private var thumbnailImage: UIImage!
    private var defaultUrl: URL!
    private var messageUrl: URL?
    private var mailUrl: URL?
    private var facebookUrl: URL?
    private var twitterUrl: URL?
    
    init(subjectText: String? = "", title: String, thumbnailImage: UIImage, defaultUrl: URL, messageUrl: URL? = nil, mailUrl: URL? = nil, facebookUrl: URL? = nil, twitterUrl: URL? = nil) {
        super.init(subjectText: subjectText, thumbnailImage: thumbnailImage)
        self.title = title
        self.thumbnailImage = thumbnailImage
        self.defaultUrl = defaultUrl
        self.messageUrl = messageUrl
        self.mailUrl = mailUrl
        self.facebookUrl = facebookUrl
        self.twitterUrl = twitterUrl
    }
    
    override func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return URL(string: "https://www.marclaberge.org")!
    }
    
    override func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        switch activityType {
        case .some(.message):
            return defaultUrl
        case .some(.mail):
            return defaultUrl
        case .some(.postToFacebook):
            return defaultUrl
        case .some(.postToTwitter):
            return defaultUrl
        default:
            return defaultUrl
        }
    }
    
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let imageProvider = NSItemProvider(object: thumbnailImage)
        let metadata = LPLinkMetadata()
        metadata.title = title
        metadata.imageProvider = imageProvider
        return metadata
    }
}
