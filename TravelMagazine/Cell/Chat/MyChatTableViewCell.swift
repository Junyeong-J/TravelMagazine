//
//  MyChatTableViewCell.swift
//  TravelMagazine
//
//  Created by 전준영 on 6/3/24.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {

    @IBOutlet var contentUIView: UIView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    func configureUI() {
        
        contentLabel.setPrimaryLabel(textColor: .black, font: .systemFont(ofSize: 15), textAlignment: .left, numberOfLines: 0)
        contentUIView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        contentUIView.layer.cornerRadius = 5
        contentUIView.layer.borderWidth = 1
        contentUIView.layer.borderColor = UIColor.lightGray.cgColor
        contentUIView.clipsToBounds = true
        
        dateLabel.setPrimaryLabel(textColor: .lightGray, font: .systemFont(ofSize: 12), textAlignment: .right, numberOfLines: 1)
        
    }
    
    func configureData(_ data: Chat?){
        contentLabel.text = data?.message
        dateLabel.text = data?.newdateHour()
    }
    
}
