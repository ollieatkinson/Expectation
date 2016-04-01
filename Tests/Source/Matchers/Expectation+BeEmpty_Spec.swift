//
//  Expectation+BeEmpty_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeEmpty_Spec: XCTestCase {

  override func tearDown() {
    super.tearDown()
    
    ExpectationAssertFunctions.assertTrue   = ExpectationAssertFunctions.ExpectationAssertTrue
    ExpectationAssertFunctions.assertFalse  = ExpectationAssertFunctions.ExpectationAssertFalse
    ExpectationAssertFunctions.assertNil    = ExpectationAssertFunctions.ExpectationAssertNil
    ExpectationAssertFunctions.assertNotNil = ExpectationAssertFunctions.ExpectationAssertNotNil
    ExpectationAssertFunctions.fail         = ExpectationAssertFunctions.ExpectationFail
    
  }
  
  func testBeEmptyPass() {
    
    assertTrueValidate(True) {
      expect([Int]()).to.beEmpty()
    }
    
  }
  
  func testBeEmptyFail() {
    
    assertTrueValidate(False) {
      expect([ 1 ]).to.beEmpty()
    }
    
    assertTrueValidate(False) {
      let array: [Int]? = nil
      expect(array).to.beEmpty()
    }
    
  }
  
}
