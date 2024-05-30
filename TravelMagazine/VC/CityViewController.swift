//
//  CityViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/29/24.
//

import UIKit

class CityViewController: UIViewController {

    let cityList = CityInfo.city
    var newList: [City] = []
    
    @IBOutlet var cityTableView: UITableView!
    @IBOutlet var citySegmented: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationTitle("인기 도시")
        configureSearchView()
        configureTableView()
        setupAddTarget()
        
    }
    
}

extension CityViewController{
    
    func configureSearchView() {
        searchBar.delegate = self
    }
    
    func configureTableView() {
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        let xib = UINib(nibName: CityTableViewCell.identifier, bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: CityTableViewCell.identifier)
        
        cityTableView.rowHeight = 150
        newList = cityList
    }
    
    func setupAddTarget() {
        
        citySegmented.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
        
    }
    
    @objc func didChangeValue(segment: UISegmentedControl){
        
        var newCity: [City] = []
        
        if segment.selectedSegmentIndex == 0 {
            newList = cityList
        } else if segment.selectedSegmentIndex == 1 {
            for item in cityList{
                if item.domestic_travel {
                    newCity.append(item)
                }
            }
            newList = newCity
        } else {
            for item in cityList{
                if !item.domestic_travel {
                    newCity.append(item)
                }
            }
            newList = newCity
        }
        
        
        cityTableView.reloadData()
    }
}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cityTableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as! CityTableViewCell
        
        cell.configureCell(data: newList[indexPath.row])
        
        return cell
    }
    
    
}

extension CityViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        var searchList: [City] = []
        
        for item in newList {
            
            if item.city_name.contains(searchBar.text!) || item.city_english_name.contains(searchBar.text!) || item.city_explain.contains(searchBar.text!) {
                
                searchList.append(item)
                
            }
            
        }
        
        newList = searchList
        
        cityTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchText.isEmpty {
            newList = cityList
            cityTableView.reloadData()
        } else {
            newList = cityList
        }
        
    }
    
}
