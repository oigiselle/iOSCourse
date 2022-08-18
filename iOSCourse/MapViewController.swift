//
//  MapViewController.swift
//  iOSCourse
//
//  Created by Giselle Salvador on 2022-08-18.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    

    var coordinate  = CLLocationCoordinate2D(latitude: 46.52935252133646, longitude: -80.94075440961068)
    var locationManager = CLLocationManager()

    @IBOutlet weak var map: MKMapView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
  
        map.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(
            latitudeDelta: 0.1,
        longitudeDelta: 0.1)),
        animated: false)
        
        
    }
    
    
 
    
    
    @IBAction func currentLocation(_ sender: Any) {
        LocationHelper.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
                
                strongSelf.map.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: true)
            }
        }
    
 
        
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
