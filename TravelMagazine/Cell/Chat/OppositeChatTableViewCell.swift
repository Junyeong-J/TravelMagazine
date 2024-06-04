//
//  OppositeChatTableViewCell.swift
//  TravelMagazine
//
//  Created by 전준영 on 6/3/24.
//

import UIKit

class OppositeChatTableViewCell: UITableViewCell {

    @IBOutlet var contentUIView: UIView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var dateChangeView: UIView!
    @IBOutlet var changeDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI(){
        nicknameLabel.setPrimaryLabel(textColor: .darkGray, font: .boldSystemFont(ofSize: 15), textAlignment: .left, numberOfLines: 0)
        
        contentLabel.setPrimaryLabel(textColor: .black, font: .systemFont(ofSize: 15), textAlignment: .left, numberOfLines: 0)
        contentUIView.backgroundColor = .white
        contentUIView.layer.cornerRadius = 5
        contentUIView.layer.borderWidth = 1
        contentUIView.layer.borderColor = UIColor.lightGray.cgColor
        contentUIView.clipsToBounds = true
        
        dateLabel.setPrimaryLabel(textColor: .lightGray, font: .systemFont(ofSize: 12), textAlignment: .left, numberOfLines: 0)
        
        profileImageView.imageViewUI(contentMode: .scaleAspectFill, cornerRadius: 15)
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.black.cgColor
        
        changeDateLabel.setPrimaryLabel(textColor: .darkGray, font: .systemFont(ofSize: 12), textAlignment: .center, numberOfLines: 1)
        
    }

    func configureData(_ data: Chat?, change: Bool, changedates: String) {
        dateChangeView.isHidden = change
        profileImageView.image = UIImage(named: (data?.user.rawValue)!)
        nicknameLabel.text = data?.user.rawValue
        contentLabel.text = data?.message
        dateLabel.text = data?.newdateHour()
        changeDateLabel.text = changedates
    }
    
}
