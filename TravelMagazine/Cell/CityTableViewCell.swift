//
//  CityTableViewCell.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/29/24.
//

import UIKit
import Kingfisher

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    @IBOutlet var cityExplainView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
        
    }
    
    func configureUI() {
        
        cityNameLabel.setPrimaryLabel(textColor: .white, font: .boldSystemFont(ofSize: 17), textAlignment: .right, numberOfLines: 0)
        
        cityExplainLabel.setPrimaryLabel(textColor: .white, font: .systemFont(ofSize: 13), textAlignment: .left, numberOfLines: 1)
        
        cityExplainView.setViewUI(backgroundColor: .black.withAlphaComponent(0.5), cornerRadius: 0)
        
        cityImageView.imageViewUI(contentMode: .scaleAspectFill, cornerRadius: 0)
        cityImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        cityImageView.layer.cornerRadius = 20
        
        cityExplainView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        cityExplainView.layer.cornerRadius = 20
    }
    
    func configureCell(data: City){
        
        let url = URL(string: data.city_image)
        cityImageView.kf.setImage(with: url)
        cityNameLabel.text = data.cityNameSetting
        cityExplainLabel.text = data.city_explain
    }
    
    
}
