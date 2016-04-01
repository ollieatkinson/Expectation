//
//  Expectation+Equal.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 21/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_Equal_Spec: XCTestCase {
  
  override func tearDown() {
    super.tearDown()
    
    ExpectationAssertFunctions.assertTrue   = ExpectationAssertFunctions.ExpectationAssertTrue
    ExpectationAssertFunctions.assertFalse  = ExpectationAssertFunctions.ExpectationAssertFalse
    ExpectationAssertFunctions.assertNil    = ExpectationAssertFunctions.ExpectationAssertNil
    ExpectationAssertFunctions.assertNotNil = ExpectationAssertFunctions.ExpectationAssertNotNil
    ExpectationAssertFunctions.fail         = ExpectationAssertFunctions.ExpectationFail
    
  }
  
  func testEqualPass() {
    
    assertTrueValidate(True) {
      expect(1).to.equal(1)
    }
    
  }
  
  func testEqualFail() {
    
    assertTrueValidate(False) {
      expect(1).to.equal(2)
    }
    
  }
    
  func testInverseEqualPass() {
    
    assertFalseValidate(False) {
      expect(1).toNot.equal(2)
    }
    
  }
  
  func testInverseEqualFail() {
    
    assertFalseValidate(True) {
      expect(1).toNot.equal(1)
    }
    
  }
  
  func testArrayEqualPass() {
    
    assertTrueValidate(True) {
      expect([ 1, 2, 3 ]).to.equal([ 1, 2, 3 ])
    }
    
  }
  
  func testArrayEqualFail() {
    
    assertTrueValidate(False) {
      expect([ 1, 2 ]).to.equal([ 1, 2, 3 ])
    }
    
  }
  
  func testArrayEqualNilInputFail() {
    
    failWithBlock {
      expect(nil).to.equal([ 1, 2, 3 ])
    }
    
  }
  
}
