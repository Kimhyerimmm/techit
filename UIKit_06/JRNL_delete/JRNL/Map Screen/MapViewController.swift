//
//  MapViewController.swift
//  JRNL
//
//  Created by 김혜림 on 5/14/24.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var sampleJournalEntryData = SampleJournalEntryData()
    var selected =
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        self.navigationItem.title = "Loading..."
        locationManager.requestLocation()
        mapView.delegate = self
        sampleJournalEntryData.createSampleJournalEntryData()
        mapView.addAnnotations(sampleJournalEntryData.journalEntries)
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let myLocation = locations.first {
            let lat = myLocation.coordinate.latitude
            let long = myLocation.coordinate.longitude
            self.navigationItem.title = "Map"
            mapView.region = setInitialRegion(lat: lat, long: long)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find uset's location: \(error.localizedDescription)")
    }
    
    
    //MARK: - MKMapViewDelegate
    func identifier(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        let identifier = "mapAnnotation"
        if annotation is JournalEntry {
            if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
                annotationView.annotation = annotation
                return annotationView
            } else {
                let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView.canShowCallout = true
                let calloutButton = UIButton(type: .detailDisclosure)
                annotationView.rightCalloutAccessoryView = calloutButton
                return annotationView
            }
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = mapView,selectedAnootations.first else {
            return
        }
        selectedJournalEntry = annotaion as? JournalEntry
        self.performSegue(withIdentifier: "showMapDetail", sender: self)
    }
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "showMapDetail" else {
            fatalError("Unexpected segue identifier")
        }
        guard let entryDetailViewController = segue.destination as? JournalEntryDetailViewController else {
            fatalError("Unexpected view controller")
        }
        entryDetailViewController.selectedJournalEntry = selectedJournalEntry
    }
    
    
    // MARK: - Methods
    func setInitialRegion(lat: CLLocationDegrees, long: CLLocationDegrees) -> MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: long),
                           span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
}
