//
//  MapViewController.swift
//  TravelMagazine
//
//  Created by 전준영 on 5/30/24.
//

import UIKit
import CoreLocation
import MapKit
import SnapKit

class MapViewController: UIViewController {
    
    var data: [Restaurant]?
    let locationManager = CLLocationManager()
    let locationButton = UIButton()
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationUI()
        mapSetting()
        
        configureButton()
        locationManager.delegate = self
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
    
    func configureButton() {
        view.addSubview(locationButton)
        
        locationButton.snp.makeConstraints { make in
            make.leading.bottom.equalTo(mapView).inset(30)
            make.size.equalTo(30)
        }
        
        locationButton.setImage(UIImage(systemName: "location.circle"), for: .normal)
        locationButton.backgroundColor = .white
        locationButton.layer.cornerRadius = 15
        
        locationButton.addTarget(self, action: #selector(locationButtonClicked), for: .touchUpInside)
    }
    
    @objc func locationButtonClicked() {
        checkCurrentLocationAuthorization()
    }
    
    func checkDeviceLocationAuthorization() {
        if CLLocationManager.locationServicesEnabled() {
            checkCurrentLocationAuthorization()
        } else {
            let alert = UIAlertController(title: nil, message: "위치 서비스가 꺼져 있어서, 위치 권한 요청을 할 수 없어요.", preferredStyle: .alert)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func checkCurrentLocationAuthorization() {
        
        var status: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            status = locationManager.authorizationStatus
        } else {
            status = CLLocationManager.authorizationStatus()
        }
        
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            setRegionAndAnnotation(center: CLLocationCoordinate2D(latitude: 37.517742, longitude: 126.886463))
            showAlertToOpenSettings()
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            print(status)
        }
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
    
    func showAlertToOpenSettings() {
        let alert = UIAlertController(title: "위치 권한", message: "위치 서비스가 꺼져 있어서, 위치 권한을 설정화면에서 켜 주세요.", preferredStyle: .alert)
        
        let settingURL = UIAlertAction(title: "권한 설정하기", style: .default) { _ in
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(settingURL)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            setRegionAndAnnotation(center: coordinate)
        }
        locationManager.stopUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkDeviceLocationAuthorization()
    }
    
}
