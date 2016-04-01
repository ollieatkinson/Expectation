//
//  Expectation+Contain_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_Contain_Spec: XCTestCase {
  
  override func tearDown() {
    super.tearDown()
    
    ExpectationAssertFunctions.assertTrue   = ExpectationAssertFunctions.ExpectationAssertTrue
    ExpectationAssertFunctions.assertFalse  = ExpectationAssertFunctions.ExpectationAssertFalse
    ExpectationAssertFunctions.assertNil    = ExpectationAssertFunctions.ExpectationAssertNil
    ExpectationAssertFunctions.assertNotNil = ExpectationAssertFunctions.ExpectationAssertNotNil
    ExpectationAssertFunctions.fail         = ExpectationAssertFunctions.ExpectationFail
    
  }
  
  func testContainPass() {
    
    assertFalseValidate(False) {
      expect([ 1, 2, 3 ]).to.contain(1)
    }
    
  }
  
  func testContainFail() {
    
    assertFalseValidate(True) {
      expect([ 1, 2, 3 ]).to.contain(4)
    }
    
    assertFalseValidate(True) {
      let integers: [Int]? = nil
      expect(integers).to.contain(1)
    }
    
  }
  
}
