//
//  PopularCitiesViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/27/24.
//

import UIKit

class PopularCitiesViewController: UIViewController {
    
    var list = TravelInfo.travel
    
    @IBOutlet var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationTitle("도시 상세 정보")
        
        configureTableView()
        
    }
    

    
}

// intrinsic content size - uilabel

//MARK: - UI설정
extension PopularCitiesViewController {
    
    func configureTableView() {
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        let cityXib = UINib(nibName: CitiesTableViewCell.identifier, bundle: nil)
        cityTableView.register(cityXib, forCellReuseIdentifier: CitiesTableViewCell.identifier)
        
        let adXib = UINib(nibName: ADTableViewCell.identifier, bundle: nil)
        cityTableView.register(adXib, forCellReuseIdentifier: ADTableViewCell.identifier)
        
    }
    
}


//MARK: -UITableViewDelegate, UITableViewDataSource 설정
extension PopularCitiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !list[indexPath.row].ad{
            return 120
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if !list[indexPath.row].ad {
            let cityCell = tableView.dequeueReusableCell(withIdentifier: CitiesTableViewCell.identifier, for: indexPath) as! CitiesTableViewCell
            cityCell.configureCell(data: list[indexPath.row])
            
            return cityCell
        } else {
            let adCell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            adCell.configureCell(data: list[indexPath.row])
            return adCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !list[indexPath.row].ad {
            let sb = UIStoryboard.init(name: TouristViewController.storyboardName, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: TouristViewController.storyboardID) as! TouristViewController
            vc.data = list[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let sb = UIStoryboard.init(name: AdvertisementViewController.storyBoardName, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: AdvertisementViewController.storyBoardID) as! AdvertisementViewController
            vc.data = list[indexPath.row]
            let nvc = UINavigationController(rootViewController: vc)
            nvc.modalPresentationStyle = .fullScreen
            present(nvc, animated: true)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
