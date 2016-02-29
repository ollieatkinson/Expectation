//
//  Expectation+BeCloseTo_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 22/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeCloseTo_Spec: XCTestCase {
  
  override func setUp() {
    super.setUp()
    
    ExpectationAssertFunctions.assertTrue = XCTAssertTrue
    ExpectationAssertFunctions.fail       = XCTFail
    
  }
  
  func testBeCloseToNilInputFail() {
    
    failWithBlock {
      expect(nil).to.beCloseTo(1, within: 0.3)
    }
    
  }
  
  func testBeCloseToPass() {
    
    assertTrueValidate(True) {
      expect(1.2).to.beCloseTo(1.0, within: 0.3)
    }
    
  }
  
  func testBeCloseToFail() {
    
    assertTrueValidate(False) {
      expect(1.2).to.beCloseTo(1.0, within: 0.1)
    }
    
  }
  
  func testBeCloseToFloatPass() {
    
    assertTrueValidate(True) {
      expect(Float(1.2)).to.beCloseTo(1.0, within: 0.3)
    }
    
  }
  
  func testBeCloseToCGFloatPass() {
    
    assertTrueValidate(True) {
      expect(CGFloat(1.2)).to.beCloseTo(1.0, within: 0.3)
    }
    
  }

}
