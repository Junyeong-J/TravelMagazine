//
//  RestaurantsViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/30/24.
//

import UIKit

class RestaurantsViewController: UIViewController {
    
    var restaurantList = RestaurantList.restaurantArray
    var newRestaurantList: [Restaurant] = []
    var selectedCategory: String? = nil
    
    let categoryList = ["한식", "카페", "중식", "양식", "분식", "일식", "경양식"]
    
    @IBOutlet var foodSearchBar: UISearchBar!
    @IBOutlet var keywordLabel: UILabel!
    @IBOutlet var categoryButton: [UIButton]!
    @IBOutlet var allButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationUI()
        setTableUI()
        
        
    }
    
    
}

extension RestaurantsViewController {
    
    func navigationUI() {
        
        self.navigationTitle("레스토랑")
        
        let map = UIBarButtonItem(image: UIImage(systemName: "map.fill"), style: .plain, target: self, action: #selector(mapButtonClicked))
        navigationItem.rightBarButtonItem = map
        
    }
    
    func setTableUI() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let xib = UINib(nibName: RestaurantsTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: RestaurantsTableViewCell.identifier)
        tableView.rowHeight = 150
        configureUI()
        
    }
    
    func configureUI() {
        
        foodSearchBar.placeholder = "식당 이름을 입력해주세요"
        foodSearchBar.tintColor = .black
        foodSearchBar.delegate = self
        
        keywordLabel.setPrimaryLabel(textColor: .black, font: .boldSystemFont(ofSize: 15), textAlignment: .left, numberOfLines: 0)
        keywordLabel.text = "카테고리"
        
        for i in 0...6{
            categoryButton[i].buttonUI(title: categoryList[i], num: i)
        }
        
        allButton.buttonUI(title: "전체 보기", num: 7)
        
        allButton.addTarget(self, action: #selector(allButtonClicked), for: .touchUpInside)
        newRestaurantList = restaurantList
    }
    
    @IBAction func categoryButtonClicked(_ sender: UIButton) {
        
        for i in 0...6{
            categoryButton[i].buttonUI(title: categoryList[i], num: i)
        }
        allButton.buttonUI(title: "전체 보기", num: 7)
        
        sender.backgroundColor = .black
        sender.setTitleColor(.white, for: .normal)
        
        var food: [Restaurant] = []
        
        for item in restaurantList {
            
            if item.category == categoryList[sender.tag]{
                food.append(item)
            }
            
        }
        
        selectedCategory = categoryList[sender.tag]
        newRestaurantList = food
        
        tableView.reloadData()
        
    }
    
    @objc func allButtonClicked(sender: UIButton) {
        
        for i in 0...6{
            categoryButton[i].buttonUI(title: categoryList[i], num: i)
        }
        
        sender.backgroundColor = .black
        sender.setTitleColor(.white, for: .normal)
        
        selectedCategory = nil
        newRestaurantList = restaurantList
        tableView.reloadData()
        
    }
    
    @objc func mapButtonClicked() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: MapViewController.identifier) as! MapViewController
        vc.data = restaurantList
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension RestaurantsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        var searchList: [Restaurant] = []
        
        for item in restaurantList {
            if let category = selectedCategory {
                if (item.name.contains(searchBar.text!) || item.category.contains(searchBar.text!)) && item.category == category {
                    searchList.append(item)
                }
            } else {
                if item.name.contains(searchBar.text!) || item.category.contains(searchBar.text!) {
                    searchList.append(item)
                }
            }
        }
        
        newRestaurantList = searchList
        tableView.reloadData()
        
    }
    
}

extension RestaurantsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newRestaurantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantsTableViewCell.identifier, for: indexPath) as! RestaurantsTableViewCell
        cell.configureCell(data: newRestaurantList[indexPath.row], indexPath: indexPath)
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    
    @objc func likeButtonClicked(sender: UIButton) {
        
        newRestaurantList[sender.tag].like.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
    }
    
}
