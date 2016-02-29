//
//  Expectation+BeGreaterThan_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeGreaterThan_Spec: XCTestCase {
  
  override func setUp() {
    super.setUp()
    
    ExpectationAssertFunctions.assertTrue = XCTAssertTrue
    
  }
  
  func testBeGreaterThanPass() {
    
    assertTrueValidate(True) {
      expect(2).to.beGreaterThan(1)
    }
    
  }
  
  func testBeGreaterThanFail() {
    
    assertTrueValidate(False) {
      expect(1).to.beGreaterThan(2)
    }
    
  }
  
}
