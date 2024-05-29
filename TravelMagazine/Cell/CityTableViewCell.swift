//
//  CityTableViewCell.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/29/24.
//

import UIKit
import Kingfisher

class CityTableViewCell: UITableViewCell {
    
    static let identifier = "CityTableViewCell"
    
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    @IBOutlet var cityExplainView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
        
//        contentView.layer.shadowColor = UIColor.black.cgColor
//        contentView.layer.masksToBounds = false
//        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
//        contentView.layer.shadowRadius = 5
//        contentView.layer.shadowOpacity = 0.3
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 20
        contentView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMaxYCorner)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20))
    }
    
    func configureUI() {
        
        cityNameLabel.setPrimaryLabel(textColor: .white, font: .boldSystemFont(ofSize: 17), textAlignment: .right, numberOfLines: 0)
        
        cityExplainLabel.setPrimaryLabel(textColor: .white, font: .systemFont(ofSize: 13), textAlignment: .left, numberOfLines: 1)
        
        cityExplainView.setViewUI(backgroundColor: .black.withAlphaComponent(0.5), cornerRadius: 0)
        
        cityImageView.imageViewUI(contentMode: .scaleAspectFill, cornerRadius: 0)
        
        
    }
    
    func configureCell(data: City){
        
        let url = URL(string: data.city_image)
        cityImageView.kf.setImage(with: url)
        cityNameLabel.text = data.cityNameSetting
        cityExplainLabel.text = data.city_explain
    }
    
    
}
