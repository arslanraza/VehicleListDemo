//
//  URLSessionDataTaskProtocol.swift
//  VehicleDemoNetwork
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation

protocol URLSessionDataTaskProtocol {
  func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }
