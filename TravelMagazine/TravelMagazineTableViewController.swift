//
//  TravelMagazineTableViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/26/24.
//

import UIKit
import Kingfisher

class TravelMagazineTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MagazineInfo().magazine.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
        let data = MagazineInfo().magazine[indexPath.row]
        
        let url = URL(string: data.photo_image)
        cell.photoImageView.kf.setImage(with: url)
        cell.photoImageView.contentMode = .scaleAspectFill
        cell.photoImageView.layer.cornerRadius = 15
        
        cell.mainTitle.text = data.title
        cell.mainTitle.font = .boldSystemFont(ofSize: 22)
        cell.mainTitle.textColor = .darkGray
        cell.mainTitle.numberOfLines = 2
        
        cell.subTitle.text = data.subtitle
        cell.subTitle.font = .boldSystemFont(ofSize: 15)
        cell.subTitle.textColor = .lightGray
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyMMdd"
        let changeFormat = DateFormatter()
        changeFormat.dateFormat = "yy년 MM월 dd일"
        
        if let date = dateFormat.date(from: data.date) {
            cell.date.text = changeFormat.string(from: date)
        } else {
            cell.date.text = nil
        }
        cell.date.font = .systemFont(ofSize: 13)
        cell.date.textColor = .lightGray
        
        return cell
    }
    
}
