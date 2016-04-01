//
//  Expectation+BeGreaterThanOrEqualTo_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeGreaterThanOrEqualTo_Spec: XCTestCase {
  
  override func tearDown() {
    super.tearDown()
    
    ExpectationAssertFunctions.assertTrue   = ExpectationAssertFunctions.ExpectationAssertTrue
    ExpectationAssertFunctions.assertFalse  = ExpectationAssertFunctions.ExpectationAssertFalse
    ExpectationAssertFunctions.assertNil    = ExpectationAssertFunctions.ExpectationAssertNil
    ExpectationAssertFunctions.assertNotNil = ExpectationAssertFunctions.ExpectationAssertNotNil
    ExpectationAssertFunctions.fail         = ExpectationAssertFunctions.ExpectationFail
    
  }
  
  func testBeGreaterThanOrEqualToPass() {
    
    assertTrueValidate(True) {
      expect(2).to.beGreaterThanOrEqualTo(1)
    }
    
    assertTrueValidate(True) {
      expect(2).to.beGreaterThanOrEqualTo(2)
    }
    
  }
  
  func testBeGreaterThanOrEqualToFail() {
    
    assertTrueValidate(False) {
      expect(1).to.beGreaterThanOrEqualTo(2)
    }
    
  }
  
}
