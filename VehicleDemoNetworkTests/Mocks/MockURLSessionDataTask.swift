//
//  MockURLSessionDataTask.swift
//  VehicleDemoNetworkTests
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
@testable import VehicleDemoNetwork

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
  private (set) var resumeWasCalled = false
  
  func resume() {
    resumeWasCalled = true
  }
}
