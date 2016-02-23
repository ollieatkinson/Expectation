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
  
  override func setUp() {
    super.setUp()
    
    ExpectationAssertFunctions.assertTrue  = XCTAssertTrue
    ExpectationAssertFunctions.assertFalse = XCTAssertFalse
    ExpectationAssertFunctions.fail        = XCTFail

  }
  
  func testEqualPasses() {
    
    assertTrueValidate(True) {
      expect(1).to.equal(1)
    }
    
  }
  
  func testEqualFails() {
    
    assertTrueValidate(False) {
      expect(1).to.equal(2)
    }
    
  }
    
  func testInverseEqualPasses() {
    
    assertFalseValidate(False) {
      expect(1).toNot.equal(2)
    }
    
  }
  
  func testInverseEqualFails() {
    
    assertFalseValidate(True) {
      expect(1).toNot.equal(1)
    }
    
  }
  
  func testArrayEqualPasses() {
    
    assertTrueValidate(True) {
      expect([ 1, 2, 3 ]).to.equal([ 1, 2, 3 ])
    }
    
  }
  
  func testArrayEqualFails() {
    
    assertTrueValidate(False) {
      expect([ 1, 2 ]).to.equal([ 1, 2, 3 ])
    }
    
  }
  
  func testArrayEqualFailsWithNilInput() {
    
    failWithBlock {
      expect(nil).to.equal([ 1, 2, 3 ])
    }
    
  }
  
}
