//
//  VehicleApiClient.swift
//  VehicleDemoNetwork
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import VehicleDemoCore


@objc public protocol VehicleService {
  @objc func fetchVehicles(completion: @escaping ([Vehicle], NSError?) -> Void)
}

@objc public class VehicleApiClient: NSObject, APIClient, VehicleService {
  let session: URLSessionProtocol
  
  public init(configuration: URLSessionConfiguration) {
    self.session = URLSession(configuration: configuration)
  }
  
  convenience public override init() {
    self.init(configuration: .default)
  }
  
  // MARK: Public Methods
  
//  public func fetchVehicles(completion: @escaping (Result<PoiList, APIError>) -> Void) {
  @objc public func fetchVehicles(completion: @escaping ([Vehicle], NSError?) -> Void) {
    let endpoint = VehicleFeed.nearby
    let request = endpoint.request
    
    fetch(with: request, decode: { json -> PoiList? in
      guard let result = json as? PoiList else {
        return  nil
      }
      return result
    }, completion: { result in
      switch result {
      case .success(let list):
        completion(list.vehicles, nil)
        
      case .failure(let error):
        completion([], NSError.from(error))
        
      }
    })
  }
  
}

extension NSError {
  class func from(_ apiError: APIError) -> NSError {
    return NSError.init(domain: "VehicleDemo", code: 0, userInfo: [NSLocalizedDescriptionKey : apiError.localizedDescription])
  }
}
