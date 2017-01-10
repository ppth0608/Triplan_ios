//
//  UIImage+Extension.swift
//  Triplan
//
//  Created by Naver on 2017. 1. 11..
//  Copyright © 2017년 Ben. All rights reserved.
//

import UIKit

extension UIView {

    func toImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
