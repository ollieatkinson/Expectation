//
//  Expectation+BeLessThanOrEqualTo_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeLessThanOrEqualTo_Spec: XCTestCase {
  
  override func tearDown() {
    super.tearDown()
    
    ExpectationAssertFunctions.assertTrue   = ExpectationAssertFunctions.ExpectationAssertTrue
    ExpectationAssertFunctions.assertFalse  = ExpectationAssertFunctions.ExpectationAssertFalse
    ExpectationAssertFunctions.assertNil    = ExpectationAssertFunctions.ExpectationAssertNil
    ExpectationAssertFunctions.assertNotNil = ExpectationAssertFunctions.ExpectationAssertNotNil
    ExpectationAssertFunctions.fail         = ExpectationAssertFunctions.ExpectationFail
    
  }
  
  func testBeLessThanOrEqualToPass() {
    
    assertTrueValidate(True) {
      expect(1).to.beLessThanOrEqualTo(2)
    }
    
    assertTrueValidate(True) {
      expect(1).to.beLessThanOrEqualTo(1)
    }
    
  }
  
  func testBeLessThanOrEqualToFail() {
    
    assertTrueValidate(False) {
      expect(2).to.beLessThanOrEqualTo(1)
    }
    
  }
  
}
