//
//  TouristViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/29/24.
//

import UIKit
import Kingfisher

class TouristViewController: UIViewController {

    static let storyboardName = "TouristSpot"
    
    var data: Travel?
    
    @IBOutlet var touristImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var gradeAndSaveLabel: UILabel!
    @IBOutlet var explainLabel: UILabel!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var explainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationTitle("관광지 화면")
        
        backButtonSetting()
        configureUI()
        setDataUI()
        
    }
 
    
}

//MARK: - UI설정
extension TouristViewController {
    
    func backButtonSetting() {
        
        let left = UIBarButtonItem(image: UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backButtonClicked))
        left.tintColor = .black
        self.navigationItem.leftBarButtonItem = left
        
    }
    
    func configureUI() {
        
        touristImageView.imageViewUI(contentMode: .scaleAspectFill, cornerRadius: 0)
        titleLabel.setPrimaryLabel(textColor: .black, font: .boldSystemFont(ofSize: 17), textAlignment: .left, numberOfLines: 0)
        gradeAndSaveLabel.setPrimaryLabel(textColor: .darkGray, font: .systemFont(ofSize: 13), textAlignment: .left, numberOfLines: 0)
        explainLabel.setPrimaryLabel(textColor: .black, font: .systemFont(ofSize: 15), textAlignment: .center, numberOfLines: 0)
        explainView.setViewUI(backgroundColor: .lightGray, cornerRadius: 10)
        
    }
    
    func setDataUI(){
        
        guard let data = data else { return }
        
        if let image = data.travel_image {
            let url = URL(string: image)
            touristImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star"))
        }else {
            touristImageView.backgroundColor = .gray
        }
        
        titleLabel.text = data.title
        gradeAndSaveLabel.text = data.gradeAndSavedDescription
        explainLabel.text = data.description
        
        if let like = data.like{
            let buttonImage = like ? "heart.fill" : "heart"
            let image = UIImage(systemName: buttonImage)
            saveButton.setImage(image, for: .normal)
        } else {
            let buttonImage = "heart"
            let image = UIImage(systemName: buttonImage)
            saveButton.setImage(image, for: .normal)
        }
    }
    
    @objc func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
