//
//  MapViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/30/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var data: [Restaurant]?
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationUI()
        mapSetting()
    }
    
}

extension MapViewController {
    
    func navigationUI() {
        
        self.navigationTitle("지도")
        
        let filter = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterButtonClicked))
        navigationItem.rightBarButtonItem = filter
        
    }
    
    func mapSetting() {
        
        guard let data = data else {return}
        
        let center = CLLocationCoordinate2D(latitude: 37.518594, longitude: 126.894798)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 2000, longitudinalMeters: 2000)
        
        for item in data{
            let annotation = MKPointAnnotation()
            annotation.coordinate = .init(latitude: item.latitude, longitude: item.longitude)
            annotation.title = item.name
            mapView.addAnnotation(annotation)
        }

    }
    
    @objc func filterButtonClicked() {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(alertUI("한식"))
        alert.addAction(alertUI("중식"))
        alert.addAction(alertUI("전체보기", all: true))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
    
    func alertUI(_ title: String, all: Bool = false) -> UIAlertAction {
        return UIAlertAction(title: title, style: .default) { _ in self.categoryFood(title: all ? nil : title)
        }
    }
    
    func categoryFood(title: String?) {
        guard let data = data else {return}
        
        mapView.removeAnnotations(mapView.annotations)
        
        var newList: [Restaurant] = []
        if title != nil{
            for item in data {
                if item.category == title {
                    newList.append(item)
                }
            }
        } else {
            newList = data
        }
        for item in newList{
            let annotation = MKPointAnnotation()
            annotation.coordinate = .init(latitude: item.latitude, longitude: item.longitude)
            annotation.title = item.name
            mapView.addAnnotation(annotation)
        }
    }
    
}
