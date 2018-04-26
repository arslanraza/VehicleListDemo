//
//  MapViewModel.swift
//  VehicleListDemo
//
//  Created by Arslan Raza on 27/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import VehicleDemoNetwork
import VehicleDemoCore
import MapKit

class MapViewModel {
  
  typealias Completion = ([Vehicle], NSError?) -> Void
  
  var apiClient: VehicleService = VehicleApiClient()
  var onCompletion: Completion?
  var isLoading: Bool = false
  
  public func refresh(for rect: MKMapRect) {
    isLoading = true
    apiClient.fetchVehicles(for: rect) { [weak self] (list, error) in
      DispatchQueue.main.async {
        self?.isLoading = false
        self?.onCompletion?(list, error)
      }
    }
  }
  
}
