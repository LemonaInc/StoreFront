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
    
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var mapView: MKMapView!
    var searchController: UISearchController!
    var searchResultsTableViewController: UITableViewController!
    var storePins:[MyCustomAnnotation] = []
    var profileView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.showsUserLocation = true

        searchResultsTableViewController = UITableViewController()
        searchResultsTableViewController.view.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.9)
        searchController = UISearchController(searchResultsController: searchResultsTableViewController)
        searchController.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        self.navigationItem.titleView = searchController.searchBar
        searchController.searchBar.placeholder = "Search for shops and products..."


        profileView = ProfileView.loadNib()
        profileView.frame = CGRectMake(0, -150, UIScreen.mainScreen().bounds.width, 200)
        self.view.addSubview(profileView)
        
        self.getUserLocation(self)
        
        print("Requesting your current location...")
        getUserLocation(self)
        view.insertSubview(toolBar, atIndex: 1)
    }

    
    @IBAction func didClickProfile(sender: AnyObject) {
        if self.profileView.frame.origin.y == -150
        {
        UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.profileView.frame = CGRectMake(0, 50, UIScreen.mainScreen().bounds.width, 150)

            }, completion: nil)
        }
        else
        {
            UIView.animateWithDuration(0.2, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.profileView.frame = CGRectMake(0, -150, UIScreen.mainScreen().bounds.width, 150)
                
                }, completion: nil)
        }
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
        
        addStore(newLocation.coordinate, price: 93)
    }
    
    // Display the custom view
    func addStore(coordinate: CLLocationCoordinate2D, price: Int) {
        print("addStore called!")
        let storePin = MyCustomAnnotation(coordinate: coordinate, price: price)
        storePins.append(storePin)
        mapView.addAnnotation(storePin)
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        let annotation1 = self.storePins[0]
        let identifier = "pin"
        var view: MKPinAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView{
            dequeuedView.annotation = annotation1
            view = dequeuedView
        } else {
            view = MKPinAnnotationView(annotation: annotation1, reuseIdentifier:identifier)
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.pinColor = MKPinAnnotationColor.Purple
        }
        
        return view
    }
}
extension ViewController: UISearchControllerDelegate
{
    func willPresentSearchController(searchController: UISearchController) {
        //caculate frame here 
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let navigationBarFrame = navigationController!.navigationBar.frame
        let tableViewY = navigationBarFrame.height + statusBarHeight
        let tableViewHeight = mapView.frame.height - navigationBarFrame.height  - toolBar.frame.height
        
        searchResultsTableViewController.tableView.frame = CGRectMake(0, tableViewY, navigationBarFrame.width, tableViewHeight)
    }
    override func viewWillLayoutSubviews() {
    }
    func presentSearchController(searchController: UISearchController) {
    }
    func didPresentSearchController(searchController: UISearchController) {
    }
    
}

class MyCustomAnnotation: NSObject, MKAnnotation {
    dynamic var coordinate: CLLocationCoordinate2D
    var price: Int?
    
    init(coordinate: CLLocationCoordinate2D, price: Int) {
        self.coordinate = coordinate
        self.price = price
    }
}

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}

class myNibFile: UIView {
    
}
