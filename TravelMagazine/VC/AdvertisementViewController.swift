//
//  AdvertisementViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/29/24.
//

import UIKit

class AdvertisementViewController: UIViewController {

    static let storyBoardName = "Advertisement"
    static let storyBoardID = "AdvertisementViewController"
    
    var data: Travel?
    
    @IBOutlet var adTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationTitle("광고 화면")
        backButtonSetting()
        configureUI()
        setData()
    }
    
}

//MARK: - UI설정
extension AdvertisementViewController {
    
    func backButtonSetting() {
        
        let left = UIBarButtonItem(image: UIImage(systemName: "x.circle")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backButtonClicked))
        left.tintColor = .black
        self.navigationItem.leftBarButtonItem = left
        
    }
    
    func configureUI() {
        
        adTitleLabel.setPrimaryLabel(textColor: .black, font: .boldSystemFont(ofSize: 17), textAlignment: .center, numberOfLines: 0)
        
    }
    
    func setData() {
        
        guard let data = data else { return }
        
        adTitleLabel.text = data.title
    }
    
    @objc func backButtonClicked() {
        dismiss(animated: true)
    }
    
}
