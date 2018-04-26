//
//  ResultTests.swift
//  VehicleDemoNetworkTests
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import VehicleDemoNetwork

class ResultTests: QuickSpec {
  override func spec() {
    describe("A Result") {
      context("when initialized for int", {
        
        let sut = Result<Int, APIError>.success(1)
        
        it("should match success value", closure: {
          switch sut {
          case .success(let value):
            expect(value) == 1
          default: break
          }
        })
        
      })
      
      context("when initialized for String", {
        
        let sut = Result<String, APIError>.success("some-test")
        
        it("should match success value", closure: {
          switch sut {
          case .success(let value):
            expect(value) == "some-test"
          default: break
          }
        })
        
      })
    }
  }
}
