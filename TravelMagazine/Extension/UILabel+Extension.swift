//
//  UILabel+Extension.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/28/24.
//

import UIKit

extension UILabel {
    
    func setPrimaryLabel(textColor: UIColor, font: UIFont, textAlignment: NSTextAlignment, numberOfLines: Int) {
        
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        
    }
    
}
