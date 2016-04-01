//
//  Expectation+BeTrue_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeTrue_Spec: XCTestCase {
  
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
      expect(true).to.beTrue()
    }
    
  }
  
  func testBeFalseFail() {
    
    assertTrueValidate(False) {
      expect(false).to.beTrue()
    }
    
  }
  
  func testBeFalsePassInverted() {
    
    assertTrueValidate(False) {
      expect(false).to.beTrue()
    }
    
  }

}
