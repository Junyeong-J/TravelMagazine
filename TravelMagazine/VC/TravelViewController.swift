//
//  TravelViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/29/24.
//

import UIKit

class TravelViewController: UIViewController {
    
    let list = MagazineInfo.magazine

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationTitle("SeSAC TRAVEL")
        configureTableView()
        
    }
    
    
    
}

//MARK: - UI 설정
extension TravelViewController {
    
    func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: TravelsTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: TravelsTableViewCell.identifier)
        
        tableView.rowHeight = 500
        
    }
    
}


//MARK: - UITableViewDelegate, UITableViewDataSource
extension TravelViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelsTableViewCell.identifier, for: indexPath) as! TravelsTableViewCell
        
        cell.configureCell(data: list[indexPath.row])
        
        return cell
    }
    
}
