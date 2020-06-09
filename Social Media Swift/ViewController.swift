//
//  ViewController.swift
//  Social Media Swift
//
//  Created by Marc-Antoine Laberge on 2020-06-08.
//  Copyright © 2020 Marc-Antoine Laberge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let buttonWidth: CGFloat = 300.0
    let buttonHeight: CGFloat = 300.0

    override func viewDidLoad() {
        super.viewDidLoad()
        let origin = CGPoint(x: self.view.center.x - buttonWidth / 2, y: self.view.center.y - buttonHeight / 2)
        let size = CGSize(width: buttonWidth, height: buttonHeight)
        
        let button: UIButton = UIButton(frame: CGRect(origin: origin, size: size))
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func shareButtonTapped(sender: UIButton!) {
        let text: String =  "Some text from Marc Laberge..."
        guard let url: URL = URL(string: "https://marclaberge.org"),
            let image: UIImage = UIImage(named: "me") else { return }
        let textItem: TextActivityItemSource =  TextActivityItemSource(subjectText: "Here's my subject for text", defaultText: text)
        let urlItem: UrlActivityItemSource = UrlActivityItemSource(subjectText: "Here's my subject for url", title: text, thumbnailImage: image, defaultUrl: url)
        let imageItem: ImageActivityItemSource = ImageActivityItemSource(subjectText: "Here's my subject for image", defaultImage: image)
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [textItem, imageItem, urlItem], applicationActivities: nil)
        activityViewController.excludedActivityTypes = [.saveToCameraRoll, .assignToContact, .print]
        self.present(activityViewController, animated: true, completion: nil)
    }
}

