//
//  MapViewController.swift
//  VehicleListDemo
//
//  Created by Arslan Raza on 27/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  
  let viewModel = MapViewModel()
  
  // MARK: Life Cycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupObservers()
    setupMap()
  }
  
  // MARK: Private Methods
  
  private func setupObservers() {
    viewModel.onCompletion = { [weak self] list, error in
      guard let strongSelf = self else {
        return
      }
      
      strongSelf.mapView.removeAnnotations(strongSelf.mapView.annotations)
      for vehicle in list {
        // Adding a pin on the coordinate points
        let annotation = MKPointAnnotation()
        annotation.coordinate = vehicle.coordinates
        strongSelf.mapView.addAnnotation(annotation)
      }
    }
  }
  
  private func setupMap() {
    // Center map to the location coordinates (Hamburg)
    let location = CLLocationCoordinate2D(latitude: 53.694865, longitude: 9.757589)
    let region = MKCoordinateRegionMakeWithDistance(location, 15000, 15000);
    mapView.setRegion(region, animated: true)
  }
}

extension MapViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    print("Region changed")
    viewModel.refresh(for: mapView.visibleMapRect)
  }
}
