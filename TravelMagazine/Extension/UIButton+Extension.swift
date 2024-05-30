//
//  UIButton+Extension.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/30/24.
//

import UIKit

extension UIButton {
    
    func buttonUI(title: String, num: Int){
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 13)
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.tag = num
    }
    
}
