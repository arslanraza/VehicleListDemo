//
//  VehicleFeedTests.swift
//  VehicleDemoNetworkTests
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import VehicleDemoNetwork

class VehicleFeedTests: QuickSpec {
  override func spec() {
    describe("VehicleFeed") {
      
      context("when created for poi", {
        let sutPoi = VehicleFeed.nearby
        
        it("should have correct url path", closure: {
          let expectedURL = "https://poi-api.mytaxi.com/poiservice/poi/v1"
          expect(sutPoi.request.url?.absoluteString).to(equal(expectedURL))
        })
      })
    }
  }
}
