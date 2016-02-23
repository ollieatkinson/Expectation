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
  
  override func setUp() {
    super.setUp()
    
    ExpectationAssertFunctions.assertTrue = XCTAssertTrue
    
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
