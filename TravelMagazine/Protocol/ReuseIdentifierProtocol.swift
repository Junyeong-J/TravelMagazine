//
//  ReuseProtocol.swift
//  TravelMagazine
//
//  Created by 전준영 on 6/1/24.
//

import UIKit

protocol ReuseIdentifierProtocol {
    
    static var identifier: String { get }
    
}

extension UIViewController: ReuseIdentifierProtocol {
    
    static var identifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifierProtocol {
    static var identifier: String {
        String(describing: self)
    }
}
