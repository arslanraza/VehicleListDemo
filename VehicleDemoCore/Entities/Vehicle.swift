//
//  Vehicle.swift
//  VehicleDemoCore
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import CoreLocation


/// Vehicle class which is extending from NSObject so that it can be used in objective-c code.

@objc public class Location: NSObject, Codable {
  public var longitude: Double = 0.0
  public var latitude: Double = 0.0
}

@objc public class Vehicle: NSObject, Codable {
  public var id: Double?
  @objc public var state: String?
  @objc public var type: String?
  public var heading: Double = 0.0
  var coordinate: Location?
  
  public var coordinates: CLLocationCoordinate2D {
    return CLLocationCoordinate2DMake(coordinate?.latitude ?? 0, coordinate?.longitude ?? 0)
  }
  
  enum CodingKeys: String, CodingKey {
    case id, state, type, heading, coordinate
  }
}
