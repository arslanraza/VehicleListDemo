//
//  VehicleFeed.swift
//  VehicleDemoNetwork
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

public enum VehicleFeed {
  case nearby
}

extension VehicleFeed: EndPoint {
  
  var queryItem: [URLQueryItem] {
    switch self {
    case .nearby:
      return [ URLQueryItem(name: "p1lat", value: "53.694865"),
      URLQueryItem(name: "p1lont", value: "9.757589"),
      URLQueryItem(name: "p2lat", value: "53.394655"),
      URLQueryItem(name: "p2lon", value: "10.099891")]
    }
  }
  
  var base: String {
    return "https://poi-api.mytaxi.com"
  }
  
  var path: String {
    
    let pathPrefix = "/poiservice/poi/v1"
    
    switch self {
    case .nearby:
      return pathPrefix
    }
  }
}
