//
//  ChatListTableViewCell.swift
//  TravelMagazine
//
//  Created by 전준영 on 6/3/24.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var contentsLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout() {
        
        nicknameLabel.setPrimaryLabel(textColor: .black, font: .boldSystemFont(ofSize: 15), textAlignment: .left, numberOfLines: 1)
        contentsLabel.setPrimaryLabel(textColor: .darkGray, font: .systemFont(ofSize: 13), textAlignment: .left, numberOfLines: 1)
        dateLabel.setPrimaryLabel(textColor: .lightGray, font: .systemFont(ofSize: 11), textAlignment: .right, numberOfLines: 1)
        profileImage.imageViewUI(contentMode: .scaleAspectFill, cornerRadius: 25)
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.black.cgColor
    }
    
    func configureCell(data: ChatRoom) {
        profileImage.image = UIImage(named: data.chatroomImage[0])
        nicknameLabel.text = data.chatroomName
        contentsLabel.text = data.chatList.last?.message
        dateLabel.text = data.chatList.last?.newdate()
    }
}
