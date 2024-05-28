//
//  TravelViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/29/24.
//

import UIKit

class TravelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = MagazineInfo.magazine

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView("SeSAC TRAVEL")
        
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: "TravelsTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "TravelsTableViewCell")
        
        tableView.rowHeight = 500
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelsTableViewCell", for: indexPath) as! TravelsTableViewCell
        
        cell.configureCell(data: list[indexPath.row])
        
        return cell
    }
    
}
