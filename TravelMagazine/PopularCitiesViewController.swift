//
//  PopularCitiesViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/27/24.
//

import UIKit

class PopularCitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = TravelInfo().travel
    
    @IBOutlet var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "도시 상세 정보"
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        let cityXib = UINib(nibName: "CitiesTableViewCell", bundle: nil)
        cityTableView.register(cityXib, forCellReuseIdentifier: "CitiesTableViewCell")
        
        let adXib = UINib(nibName: "ADTableViewCell", bundle: nil)
        cityTableView.register(adXib, forCellReuseIdentifier: "ADTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !list[indexPath.row].ad!{
            return 120
        } else {
            return 100
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if !list[indexPath.row].ad! {
            let cityCell = tableView.dequeueReusableCell(withIdentifier: "CitiesTableViewCell", for: indexPath) as! CitiesTableViewCell
            cityCell.configureCell(data: list[indexPath.row])
            
            return cityCell
        } else {
            let adCell = tableView.dequeueReusableCell(withIdentifier: "ADTableViewCell", for: indexPath) as! ADTableViewCell
            adCell.configureCell(data: list[indexPath.row])
            return adCell
        }
        
    }
    
}
