//
//  VehicleTableViewCell.swift
//  VehicleListDemo
//
//  Created by Arslan Raza on 27/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import VehicleDemoCore

extension VehicleTableViewCell {
  @objc func configure(with vehicle: Vehicle) {
    typeLabel.text = vehicle.type;
    stateLabel.text = vehicle.state;
    
    // Center map to the location coordinates
    let location = vehicle.coordinates
    let region = MKCoordinateRegionMakeWithDistance(location, 1000, 1000);
    mapVIew.setRegion(region, animated: true)
    
    // Adding a pin on the coordinate points
    mapVIew.removeAnnotations(mapVIew.annotations)
    mapVIew.addAnnotation(at: location)
  }
}
