//
//  ADTableViewCell.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/27/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    @IBOutlet var adView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var infoView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
    
    func configureUI() {
        
        adView.layer.cornerRadius = 10
        adView.backgroundColor = RandomColor()
        
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        infoView.backgroundColor = .white
        infoView.layer.cornerRadius = 5
    }
    
    func configureCell(data: Travel) {
        
        titleLabel.text = data.title
        
    }
    
    func RandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }
    
}
