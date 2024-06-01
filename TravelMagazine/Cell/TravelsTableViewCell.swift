//
//  TravelsTableViewCell.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/29/24.
//

import UIKit
import Kingfisher

class TravelsTableViewCell: UITableViewCell {
    
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        
        travelImageView.imageViewUI(contentMode: .scaleAspectFill, cornerRadius: 15)
        titleLabel.setPrimaryLabel(textColor: .darkGray, font: .boldSystemFont(ofSize: 22), textAlignment: .left, numberOfLines: 2)
        subTitleLabel.setPrimaryLabel(textColor: .lightGray, font: .boldSystemFont(ofSize: 15), textAlignment: .left, numberOfLines: 0)
        dateLabel.setPrimaryLabel(textColor: .lightGray, font: .systemFont(ofSize: 13), textAlignment: .left, numberOfLines: 0)
        
    }
    
    func configureCell(data: Magazine) {
        
        let url = URL(string: data.photo_image)
        travelImageView.kf.setImage(with: url)
        
        titleLabel.text = data.title
        subTitleLabel.text = data.subtitle
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyMMdd"
        let changeFormat = DateFormatter()
        changeFormat.dateFormat = "yy년 MM월 dd일"
        if let date = dateFormat.date(from: data.date) {
            dateLabel.text = changeFormat.string(from: date)
        } else {
            dateLabel.text = nil
        }
        
    }
    
}
