//
//  PoiListTests.swift
//  VehicleListDemoTests
//
//  Created by Arslan Raza on 26/4/18.
//  Copyright © 2018 ArkTechs. All rights reserved.
//

import UIKit
import Foundation
import Quick
import Nimble
import CoreLocation

@testable import VehicleDemoCore

class PoiListTests: QuickSpec {
  override func spec() {
    describe("PoiList") {
      
      context("after loading from a json", {
        
        let url = Bundle(for: type(of: self)).url(forResource: "vehicles", withExtension: "json")
        let data = try? Data(contentsOf: url!)
        
        it("should have data", closure: {
          expect(data).notTo(beNil())
        })
        
        context("and when serialized", {
          
          let decoder = JSONDecoder()
          let sut = try? decoder.decode(PoiList.self, from: data!)
          
          it("array should not be nil", closure: {
            expect(sut).notTo(beNil())
          })
          
          it("should have 5 elements", closure: {
            expect(sut?.vehicles.count).to(equal(10))
          })
          
          let sutCoordinates = sut?.vehicles.first?.coordinates
          
          it("should have valid coordinates", closure: {
            expect(sutCoordinates).notTo(be(kCLLocationCoordinate2DInvalid))
          })
        })
      })
    }
  }
}
