//
//  UIView.swift
//  Social Media Swift
//
//  Created by Marc-Antoine Laberge on 2020-06-10.
//  Copyright © 2020 Marc-Antoine Laberge. All rights reserved.
//

import UIKit

extension UIView {
    var imageRepresentation: UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        let ctx = UIGraphicsGetCurrentContext()
        UIColor.clear.set()
        ctx?.fill(bounds)
        
        if UIGraphicsGetCurrentContext() != nil {
            drawHierarchy(in: bounds, afterScreenUpdates: true)
            
            if let ctx = ctx {
                layer.backgroundColor = UIColor.clear.cgColor
                layer.render(in: ctx)
            }
            
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            guard let cg = screenshot?.cgImage else {
                return nil
            }
            
            return UIImage(cgImage: cg)
        } else {
            return nil
        }
    }
}
