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
  var base: String {
    return "https://poi-api.mytaxi.com"
  }
  
  var path: String {
    
    let pathPrefix = "/poiservice/poi/v1"
    
    switch self {
    case .nearby:
      return pathPrefix.appending("")
    }
  }
}
