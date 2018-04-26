//
//  Vehicle.swift
//  VehicleDemoCore
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation


/// Vehicle class which is extending from NSObject so that it can be used in objective-c code.
@objc public class Vehicle: NSObject, Codable {
  public var id: Double?
  @objc public var state: String?
  @objc public var type: String?
  public let heading: Double = 0.0
  
  enum CodingKeys: String, CodingKey {
    case id, state, type, heading
  }
}
