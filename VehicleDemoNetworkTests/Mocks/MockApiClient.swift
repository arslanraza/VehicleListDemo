//
//  MockApiClient.swift
//  VehicleDemoNetworkTests
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

@testable import VehicleDemoNetwork

class MockAPI: APIClient {
  var session: URLSessionProtocol
  
  init(with expectedData: Data?, expectedError: Error?) {
    let mockSession = MockURLSession()
    mockSession.nextData = expectedData
    mockSession.nextError = expectedError
    self.session = mockSession
  }
}

