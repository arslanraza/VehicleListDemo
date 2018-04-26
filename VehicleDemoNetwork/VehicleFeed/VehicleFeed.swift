//
//  VehicleFeed.swift
//  VehicleDemoNetwork
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import MapKit

public enum VehicleFeed {
  case nearby
  case forRegion(mapRect: MKMapRect)
}

extension VehicleFeed: EndPoint {
  
  var queryItem: [URLQueryItem] {
    switch self {
    case .nearby:
      return [ URLQueryItem(name: "p1Lat", value: "53.694865"),
      URLQueryItem(name: "p1Lon", value: "9.757589"),
      URLQueryItem(name: "p2Lat", value: "53.394655"),
      URLQueryItem(name: "p2Lon", value: "10.099891")]
      
    case .forRegion(let mapRect):
      let boundingBox = BoundingBox(rect: mapRect)
      return [ URLQueryItem(name: "p1Lat", value: String(boundingBox.max.latitude)),
               URLQueryItem(name: "p1Lon", value: String(boundingBox.max.longitude)),
               URLQueryItem(name: "p2Lat", value: String(boundingBox.min.latitude)),
               URLQueryItem(name: "p2Lon", value: String(boundingBox.min.longitude))]
    }
  }
  
  var base: String {
    return "https://poi-api.mytaxi.com"
  }
  
  var path: String {
    
    let pathPrefix = "/poiservice/poi/v1"
    
    switch self {
    case .nearby, .forRegion(_):
      return pathPrefix
    }
  }
}

struct BoundingBox {
  let min: CLLocationCoordinate2D
  let max: CLLocationCoordinate2D
  
  init(rect: MKMapRect) {
    let bottomLeft = MKMapPointMake(rect.origin.x, MKMapRectGetMaxY(rect))
    let topRight = MKMapPointMake(MKMapRectGetMaxX(rect), rect.origin.y)
    
    min = MKCoordinateForMapPoint(bottomLeft)
    max = MKCoordinateForMapPoint(topRight)
  }
  
  var points: [CLLocationDegrees] {
    return [
      min.latitude,
      min.longitude,
      max.latitude,
      max.longitude,
    ]
  }
}
