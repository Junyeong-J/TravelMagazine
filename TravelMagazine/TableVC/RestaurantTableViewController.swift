//
//  RestaurantTableViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/26/24.
//

import UIKit

class RestaurantTableViewController: UITableViewController, UISearchBarDelegate {
    
    var restaurantList = RestaurantList.restaurantArray
    var newRestaurantList: [Restaurant] = []
    
    var selectedCategory = ""
    
    @IBOutlet var foodSearchBar: UISearchBar!
    @IBOutlet var keywordLabel: UILabel!
    @IBOutlet var categoryButton: [UIButton]!
    @IBOutlet var allButton: UIButton!
    
    let categoryList = ["한식", "카페", "중식", "양식", "분식", "일식", "경양식"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodSearchBar.placeholder = "식당 이름을 입력해주세요"
        foodSearchBar.tintColor = .black
        foodSearchBar.delegate = self
        
        labelUI(keywordLabel, title: "카테고리")
        
        for i in 0...6{
            buttonUI(categoryButton[i], title: categoryList[i], num: i)
        }
        
        buttonUI(allButton, title: "전체 보기", num: 7)
        allButton.setTitleColor(.white, for: .normal)
        allButton.backgroundColor = .black
        
        
        allButton.addTarget(self, action: #selector(allButtonClicked), for: .touchUpInside)
        
        newRestaurantList = restaurantList
    }
    
    func labelUI(_ label: UILabel, title: String){
        label.text = title
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
    }
    
    func buttonUI(_ button: UIButton, title: String, num: Int){
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.tag = num
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        var searchList: [Restaurant] = []
        
        for item in restaurantList {
            
            if item.name.contains(searchBar.text!) || item.category.contains(searchBar.text!) {
                searchList.append(item)
            }
        }
        
        newRestaurantList = searchList
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newRestaurantList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        
        cell.configureCell(data: newRestaurantList[indexPath.row], indexPath: indexPath)
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc func likeButtonClicked(sender: UIButton) {
        
        newRestaurantList[sender.tag].like.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
    }
    
    @IBAction func categoryButtonClicked(_ sender: UIButton) {
        
        for i in 0...6{
            buttonUI(categoryButton[i], title: categoryList[i], num: i)
        }
        buttonUI(allButton, title: "전체 보기", num: 7)
        
        sender.backgroundColor = .black
        sender.setTitleColor(.white, for: .normal)
        
        var food: [Restaurant] = []
        
        for item in restaurantList {
            
            if item.category == categoryList[sender.tag]{
                food.append(item)
            }
            
        }
        
        newRestaurantList = food
        
        tableView.reloadData()
        
    }
    
    @objc func allButtonClicked(sender: UIButton) {
        
        for i in 0...6{
            buttonUI(categoryButton[i], title: categoryList[i], num: i)
        }
        
        sender.backgroundColor = .black
        sender.setTitleColor(.white, for: .normal)
        
        newRestaurantList = restaurantList
        tableView.reloadData()
        
    }
}
