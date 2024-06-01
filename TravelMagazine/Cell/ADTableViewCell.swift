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
        
        adView.setViewUI(backgroundColor: .RandomColor(UIColor())(), cornerRadius: 10)
        infoView.setViewUI(backgroundColor: .white, cornerRadius: 5)
        titleLabel.setPrimaryLabel(textColor: .black, font: .boldSystemFont(ofSize: 15), textAlignment: .center, numberOfLines: 0)
        
    }
    
    func configureCell(data: Travel) {
        
        titleLabel.text = data.title
        
    }
    
}
