//
//  CitiesTableViewCell.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/27/24.
//

import UIKit
import Kingfisher
import Cosmos

class CitiesTableViewCell: UITableViewCell {
    
    static let identifier = "CitiesTableViewCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var starScoreView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayout()
    }
    
    func configureLayout() {
        
        titleLabel.setPrimaryLabel(textColor: .darkGray, font: .boldSystemFont(ofSize: 17), textAlignment: .left, numberOfLines: 0)
        subTitleLabel.setPrimaryLabel(textColor: .gray, font: .systemFont(ofSize: 13), textAlignment: .left, numberOfLines: 0)
        gradeLabel.setPrimaryLabel(textColor: .lightGray, font: .systemFont(ofSize: 12), textAlignment: .left, numberOfLines: 0)
        
        cityImageView.imageViewUI(contentMode: .scaleAspectFill, cornerRadius: 10)
    }
    
    func configureCell(data: Travel) {
        
        titleLabel.text = data.title
        subTitleLabel.text = data.description
        
        if let image = data.travel_image {
            let url = URL(string: image)
            cityImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star"))
        }else {
            cityImageView.backgroundColor = .gray
        }
        
        starScoreView.rating = data.starScore
        gradeLabel.text = data.savedDescription
        
        if let like = data.like{
            let buttonImage = like ? "heart.fill" : "heart"
            let image = UIImage(systemName: buttonImage)
            likeButton.setImage(image, for: .normal)
        } else {
            let buttonImage = "heart"
            let image = UIImage(systemName: buttonImage)
            likeButton.setImage(image, for: .normal)
        }
        
        
    }
}
