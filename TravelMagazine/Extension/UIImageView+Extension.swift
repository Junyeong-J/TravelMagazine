//
//  UIImageView+Extension.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/29/24.
//

import UIKit

extension UIImageView {
    
    func imageViewUI(contentMode: UIView.ContentMode, cornerRadius: Double) {
        
        self.contentMode = contentMode
        self.layer.cornerRadius = cornerRadius
        
    }
    
}
