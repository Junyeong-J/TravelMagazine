//
//  RestaurantTableViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/26/24.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantList = RestaurantList()
    var newRestaurantList = [Restaurant]()
    var price = 0
    var selectedCategory = ""
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var keywordLabel: [UILabel]!
    @IBOutlet var categoryButton: [UIButton]!
    @IBOutlet var priceSlider: UISlider!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var searchButton: UIButton!
    
    let categoryList = ["한식", "카페", "중식", "양식", "분식", "일식", "경양식"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.placeholder = "식당 이름을 입력해주세요"
        searchTextField.tintColor = .black
        
        labelUI(keywordLabel[0], title: "카테고리")
        labelUI(keywordLabel[1], title: "가격")
        
        for i in 0...6{
            buttonUI(categoryButton[i], title: categoryList[i], num: i)
        }
        
        priceSlider.value = 1
        priceSlider.minimumValue = 0
        priceSlider.maximumValue = 10000
        
        searchButton.backgroundColor = .black
        searchButton.setTitle("검색하기", for: .normal)
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.layer.cornerRadius = 10
        
        newRestaurantList = restaurantList.restaurantArray
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
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        let value = sender.value
        priceLabel.text = String(Int(value))
        price = Int(value)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newRestaurantList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        
        let data = newRestaurantList[indexPath.row]
        
        let url = URL(string: data.image)
        cell.photoImageView.kf.setImage(with: url)
        cell.photoImageView.contentMode = .scaleAspectFill
        cell.photoImageView.layer.cornerRadius = 15
        
        
        cell.title.text = data.name
        cell.title.font = .boldSystemFont(ofSize: 15)
        cell.title.textColor = .darkGray
        cell.title.numberOfLines = 2
        
        cell.address.text = "주소: \(data.address)"
        cell.address.font = .systemFont(ofSize: 13)
        cell.address.textColor = .lightGray
        cell.address.numberOfLines = 2
        
        cell.phoneNumber.text = "전화번호: \(data.phoneNumber)"
        cell.phoneNumber.font = .systemFont(ofSize: 13)
        cell.phoneNumber.textColor = .lightGray
        cell.phoneNumber.numberOfLines = 0
        
        cell.priceLabel.text = "가격: \(String(data.price))"
        cell.priceLabel.font = .systemFont(ofSize: 15)
        cell.priceLabel.textColor = .red
        
        let storeName = data.like ? "heart.fill" : "heart"
        let storeImage = UIImage(systemName: storeName)
        cell.likeButton.setImage(storeImage, for: .normal)
        cell.likeButton.tintColor = .red
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc func likeButtonClicked(sender: UIButton) {
        
        newRestaurantList[sender.tag].like.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        
        guard let searchText = searchTextField.text?.lowercased() else {
            newRestaurantList = restaurantList.restaurantArray
            tableView.reloadData()
            return
        }
        
        if searchText.count == 0 {
            if selectedCategory == ""{
                newRestaurantList = restaurantList.restaurantArray.filter { $0.price <= price }
            }else{
                newRestaurantList = restaurantList.restaurantArray.filter { $0.category == selectedCategory }
                
                newRestaurantList = newRestaurantList.filter { $0.price <= price }
            }
        } else {
            
            if selectedCategory == ""{
                
                newRestaurantList = restaurantList.restaurantArray.filter { $0.name.lowercased().contains(searchText) }
                
                newRestaurantList = newRestaurantList.filter { $0.price <= price }
                
            } else {
                newRestaurantList = restaurantList.restaurantArray.filter { $0.name.lowercased().contains(searchText) }
                
                newRestaurantList = newRestaurantList.filter { $0.category == selectedCategory }
                
                newRestaurantList = newRestaurantList.filter { $0.price <= price }
            }
            
        }
        
        
        tableView.reloadData()
        
        
    }
    
    @IBAction func categoryButtonClicked(_ sender: UIButton) {
        
        for i in 0...6{
            buttonUI(categoryButton[i], title: categoryList[i], num: i)
        }
        
        sender.backgroundColor = .black
        sender.setTitleColor(.white, for: .normal)
        
        selectedCategory = categoryList[sender.tag]
        
    }
    
    
    
}
