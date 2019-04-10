//
//  DetailedVC.swift
//  ResturantSampleApp
//
//  Created by M L Ragul on 10/04/19.
//  Copyright © 2019 M L Ragul. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class DetailedVC: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    var getDestlat : Double = 0
    var getDestlng : Double = 0
    var getCurrentlat : Double = 0
    var getCurrentlng : Double = 0
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!

    override func viewDidLoad() {
        super.viewDidLoad()
        locManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            guard let currentLocation = locManager.location else {
                return
            }
//            getCurrentlat = currentLocation.coordinate.latitude
//            getCurrentlng = currentLocation.coordinate.longitude
            
            self.drawPath(getCuuentLat: currentLocation.coordinate.latitude, getCurrentLng: currentLocation.coordinate.longitude)
        }
        // Do any additional setup after loading the view.
    }
    
    
    func drawPath (getCuuentLat: Double, getCurrentLng: Double) {
        let cameraPositionCoordinates = CLLocationCoordinate2D(latitude: getCuuentLat, longitude: getCurrentLng)
        let cameraPosition = GMSCameraPosition.camera(withTarget: cameraPositionCoordinates, zoom: 15)
        
        let mapView = GMSMapView.map(withFrame: .zero, camera: cameraPosition)
        mapView.isMyLocationEnabled = true
        
        let markerCurrent = GMSMarker()
        markerCurrent.position = CLLocationCoordinate2DMake(getCuuentLat, getCurrentLng)
        markerCurrent.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        markerCurrent.map = mapView
        
        let markerDest = GMSMarker()
        markerDest.position = CLLocationCoordinate2DMake(getDestlat, getDestlng)
        markerDest.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        markerDest.map = mapView
        
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2DMake(getCuuentLat, getCurrentLng))
        path.add(CLLocationCoordinate2DMake(getDestlat, getDestlng))
        
        let rectangle = GMSPolyline(path: path)
        rectangle.strokeWidth = 2.0
        rectangle.map = mapView
        
        self.view = mapView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
