//
//  RestaurantsTableViewCell.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/30/24.
//

import UIKit

class RestaurantsTableViewCell: UITableViewCell {

    static let identfier = "RestaurantsTableViewCell"
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout() {
        
        title.font = .boldSystemFont(ofSize: 15)
        title.textColor = .darkGray
        title.numberOfLines = 2
        
        address.font = .systemFont(ofSize: 13)
        address.textColor = .lightGray
        address.numberOfLines = 2
        
        phoneNumber.font = .systemFont(ofSize: 13)
        phoneNumber.textColor = .lightGray
        phoneNumber.numberOfLines = 0
        
        priceLabel.font = .systemFont(ofSize: 15)
        priceLabel.textColor = .red
        
        
    }
    
    func configureCell(data: Restaurant, indexPath: IndexPath) {
        let url = URL(string: data.image)
        photoImageView.kf.setImage(with: url)
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.layer.cornerRadius = 15
        
        title.text = data.name
        
        address.text = "주소: \(data.address)"
        
        phoneNumber.text = "전화번호: \(data.phoneNumber)"
        
        priceLabel.text = "가격: \(data.price.formatted())원"
        
        let storeName = data.like ? "heart.fill" : "heart"
        let storeImage = UIImage(systemName: storeName)
        likeButton.setImage(storeImage, for: .normal)
        likeButton.tintColor = .red
        likeButton.tag = indexPath.row
    }
    
    
    
}
