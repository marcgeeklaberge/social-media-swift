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
        
        guard let instagramImage: UIImage = UIImage(named: "instagram-icon") else { return }
        
        let instagramActivity: BaseActivity = BaseActivity(title: "Share story", image: instagramImage) { sharedItems in
            if let urlScheme = URL(string: "instagram-stories://share") {
                if UIApplication.shared.canOpenURL(urlScheme) {
                    
                    let stickerImageView: UIImageView = UIImageView(image: image)
                    stickerImageView.clipsToBounds = true
                    stickerImageView.backgroundColor = .clear
                    stickerImageView.isOpaque = false
                    stickerImageView.layer.cornerRadius = 100.0
                    
                    guard let stickerImageData: Data = stickerImageView.imageRepresentation!.pngData() else { return }
                    
                    let backgroundImageView: UIView = UIView(frame: self.view.frame)
                    backgroundImageView.backgroundColor = .cyan
                    guard let starImage: UIImage = UIImage(named: "star") else { return }
                    let starImageView: UIImageView = UIImageView(image: starImage)
                    starImageView.translatesAutoresizingMaskIntoConstraints = false
                    backgroundImageView.addSubview(starImageView)
                    NSLayoutConstraint.activate([
                        NSLayoutConstraint(item: starImageView, attribute: .centerX, relatedBy: .equal, toItem: backgroundImageView, attribute: .centerX, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: starImageView, attribute: .bottom, relatedBy: .equal, toItem: backgroundImageView, attribute: .bottom, multiplier: 1.0, constant: -120),
                        starImageView.heightAnchor.constraint(equalToConstant: 60),
                        starImageView.widthAnchor.constraint(equalToConstant: 60)
                    ])
                    
                    guard let backgroundImageData: Data = backgroundImageView.imageRepresentation!.pngData() else { return }
                    
                    let items = [["com.instagram.sharedSticker.stickerImage": stickerImageData,
                                  "com.instagram.sharedSticker.backgroundImage": backgroundImageData,
                                  "com.instagram.sharedSticker.backgroundTopColor": "#ffffff",
                                  "com.instagram.sharedSticker.backgroundBottomColor": "#000000",
                                  "com.instagram.sharedSticker.contentURL": "https://marclaberge.org"]]
                    
                    let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(10*5), ]
                    UIPasteboard.general.setItems(items, options: pasteboardOptions)
                    UIApplication.shared.open(urlScheme, options: [:], completionHandler: nil)
                }
            }
        }
        
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [textItem, imageItem, urlItem], applicationActivities: [instagramActivity])
        activityViewController.excludedActivityTypes = [.saveToCameraRoll, .assignToContact, .print]
        self.present(activityViewController, animated: true, completion: nil)
    }
}
