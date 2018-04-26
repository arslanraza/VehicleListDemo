//
//  Result.swift
//  VehicleDemoNetwork
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

/// A Generic Object that will be used as a result for all network call
///
/// - success: Invoked when request has been done successfully
/// - failure: Invoked when there is some error during the request i.e No internet or JSON Parsing error
public enum Result<T, U: Error> {
  case success(T)
  case failure(U)
}
