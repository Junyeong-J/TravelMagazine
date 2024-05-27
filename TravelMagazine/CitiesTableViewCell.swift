//
//  CitiesTableViewCell.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/27/24.
//

import UIKit
import Kingfisher

class CitiesTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var gradeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayout()
    }
    
    func configureLayout() {
        titleLabel.font = .boldSystemFont(ofSize: 17)
        titleLabel.textColor = .darkGray
        
        subTitleLabel.font = .systemFont(ofSize: 13)
        subTitleLabel.textColor = .gray
        subTitleLabel.numberOfLines = 0
        
        cityImageView.layer.cornerRadius = 10
        
        gradeLabel.font = .systemFont(ofSize: 12)
        gradeLabel.textColor = .lightGray
    }
    
    func configureCell(data: Travel) {
        
        titleLabel.text = data.title
        subTitleLabel.text = data.description
        if let image = data.travel_image {
            let url = URL(string: image)
            cityImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star"))
            cityImageView.contentMode = .scaleAspectFill
        }else {
            cityImageView.backgroundColor = .gray
        }
        
        if let grade = data.grade, let save = data.save?.formatted(){
            gradeLabel.text = "평점: \(grade) | 저장: \(save)"
        } else {
            gradeLabel.text = "평점: 0 | 저장: 0"
        }
        
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
