//
//  Expectation+BeFalse_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 22/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeFalse_Spec: XCTestCase {
  
  override func tearDown() {
    super.tearDown()
    
    ExpectationAssertFunctions.assertTrue   = ExpectationAssertFunctions.ExpectationAssertTrue
    ExpectationAssertFunctions.assertFalse  = ExpectationAssertFunctions.ExpectationAssertFalse
    ExpectationAssertFunctions.assertNil    = ExpectationAssertFunctions.ExpectationAssertNil
    ExpectationAssertFunctions.assertNotNil = ExpectationAssertFunctions.ExpectationAssertNotNil
    ExpectationAssertFunctions.fail         = ExpectationAssertFunctions.ExpectationFail
    
  }
  
  func testBeFalsePass() {
    
    assertTrueValidate(True) {
      expect(false).to.beFalse()
    }
    
  }
  
  func testBeFalseFail() {
    
    assertTrueValidate(False) {
      expect(true).to.beFalse()
    }
    
  }
  
  func testBeFalsePassInverted() {
    
    assertTrueValidate(False) {
      expect(true).to.beFalse()
    }
    
  }
  
}
