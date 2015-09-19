//
//  ViewController.swift
//  Findy
//
//  Created by Oskar Zhang on 9/19/15.
//  Copyright © 2015 FindyTeam. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate {
    let locationManager: CLLocationManager = CLLocationManager() // the object that provides us the location data
    var userLocation: CLLocation!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var toolBar: UIToolbar!
    var searchController:UISearchController!
    var searchResultsTableViewController:UITableViewController!
    var storePins:[CustomPin] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.showsUserLocation = true

        searchResultsTableViewController = UITableViewController()
        searchController = UISearchController(searchResultsController: searchResultsTableViewController)
        
        self.navigationItem.titleView = searchController.searchBar
        self.getUserLocation(self)
        
        print("Requesting your current location...")
        getUserLocation(self)
        view.insertSubview(toolBar, atIndex: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapOnGetLocation(sender: AnyObject){
        getUserLocation(self)
    }

    func getUserLocation(sender: AnyObject) {
        locationManager.delegate = self // instantiate the CLLocationManager object
        
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.startUpdatingLocation()
        // continuously send the application a stream of location data
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        mapView.setCenterCoordinate(newLocation.coordinate, animated: true)
        let viewRegion = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 500, 500)
        mapView.setRegion(viewRegion, animated: true)
        manager.stopUpdatingLocation()
    }
    
    func addStore(coordinate:CLLocationCoordinate2D,title:String) {
        let storePin = CustomPin(title: title, locationName: "", discipline: "", coordinate: coordinate)
        storePins.append(storePin)
        mapView.addAnnotation(storePin)
    }
}


class CustomPin: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
