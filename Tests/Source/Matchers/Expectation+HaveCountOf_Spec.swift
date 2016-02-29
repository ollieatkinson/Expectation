//
//  Expectation+HaveCountOf_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_HaveCountOf_Spec: XCTestCase {
  
  override func setUp() {
    super.setUp()
    ExpectationAssertFunctions.assertTrue = XCTAssertTrue
  }
  
  func testHaveCountOfPass() {
    
    assertTrueValidate(True) {
      expect([Int]()).to.haveCountOf(0)
    }
    
    assertTrueValidate(True) {
      expect([ 1, 2, 3 ]).to.haveCountOf(3)
    }
    
  }
  
  func testHaveCountOfFail() {
    
    assertTrueValidate(False) {
      expect([Int]()).to.haveCountOf(1)
    }
    
    assertTrueValidate(False) {
      expect([ 1, 2, 3 ]).to.haveCountOf(2)
    }
    
  }
  
}
