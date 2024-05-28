//
//  UIColor+Extension.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/28/24.
//

import UIKit

extension UIColor {
    
    
    func RandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }
    
    
}
