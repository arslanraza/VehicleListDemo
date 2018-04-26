//
//  MKMapView+Extra.swift
//  VehicleListDemo
//
//  Created by Arslan Raza on 27/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import MapKit

extension MKMapView {
  @objc func addAnnotation(at coordinates: CLLocationCoordinate2D) {
    let annotation = MKPointAnnotation()
    annotation.coordinate = coordinates
    addAnnotation(annotation)
  }
}
