//
//  VehicleApiClient.swift
//  VehicleDemoNetwork
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import VehicleDemoCore


public protocol VehicleService {
  func fetchVehicles(completion: @escaping (Result<PoiList, APIError>) -> Void)
}

public class VehicleAPIClient: APIClient, VehicleService {
  let session: URLSessionProtocol
  
  public init(configuration: URLSessionConfiguration) {
    self.session = URLSession(configuration: configuration)
  }
  
  convenience public init() {
    self.init(configuration: .default)
  }
  
  // MARK: Public Methods
  
  public func fetchVehicles(completion: @escaping (Result<PoiList, APIError>) -> Void) {
    let endpoint = VehicleFeed.nearby
    let request = endpoint.request
    
    fetch(with: request, decode: { json -> PoiList? in
      guard let result = json as? PoiList else {
        return  nil
      }
      return result
    }, completion: completion)
  }
  
}
