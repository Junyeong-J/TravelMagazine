//
//  TouristViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/29/24.
//

import UIKit

class TouristViewController: UIViewController {

    static let storyboardName = "TouristSpot"
    static let storyboardID = "TouristViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationTitle("관광지 화면")
        
        backButtonSetting()
    }
 
    
}

//MARK: - UI설정
extension TouristViewController {
    
    func backButtonSetting() {
        
        let left = UIBarButtonItem(image: UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backButtonClicked))
        left.tintColor = .black
        self.navigationItem.leftBarButtonItem = left
        
    }
    
    @objc func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
}
