//
//  BaseActivityItemSource.swift
//  Social Media Swift
//
//  Created by Marc-Antoine Laberge on 2020-06-09.
//  Copyright © 2020 Marc-Antoine Laberge. All rights reserved.
//

import UIKit

class BaseActivityItemSource: NSObject, UIActivityItemSource {
    private var subjectText: String!
    private var thumbnailImage: UIImage!
    
    init(subjectText: String? = "", thumbnailImage: UIImage = UIImage()) {
        super.init()
        self.subjectText = subjectText
        self.thumbnailImage = thumbnailImage
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return NSObject()
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return nil
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        return subjectText
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, thumbnailImageForActivityType activityType: UIActivity.ActivityType?, suggestedSize size: CGSize) -> UIImage? {
        return thumbnailImage
    }
}
