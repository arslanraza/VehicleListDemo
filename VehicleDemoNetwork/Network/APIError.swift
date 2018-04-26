//
//  APIError.swift
//  VehicleDemoNetwork
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

/// An enum to represent all possible cases for a network request to fail
public enum APIError: Error {
  case failed
  case jsonConversionFailed
  case invalidData
  case responseUnsuccessful
  case jsonParsingFailure
  
  var localizedDescription: String {
    switch self {
    case .failed: return "Request Failed"
    case .jsonConversionFailed: return "JSON Conversion Failure"
    case .invalidData: return "Invalid Data"
    case .responseUnsuccessful: return "Response Unsuccessful"
    case .jsonParsingFailure: return "JSON Parsing Failure"
    }
  }
}
