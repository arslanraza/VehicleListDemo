//
//  PoiList.swift
//  VehicleDemoCore
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

@objc public final class PoiList: NSObject, Codable {
  public var vehicles: [Vehicle] = []
  
  enum CodingKeys: String, CodingKey {
    case vehicles = "poiList"
  }
  
  public required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    vehicles = try container.decode([Vehicle].self, forKey: .vehicles)
  }
}
