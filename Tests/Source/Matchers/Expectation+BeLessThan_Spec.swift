//
//  Expectation+BeLessThan_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeLessThan_Spec: XCTestCase {
  
  override func setUp() {
    super.setUp()
    
    ExpectationAssertFunctions.assertTrue = XCTAssertTrue
    
  }
  
  func testBeLessThanPass() {
    
    assertTrueValidate(True) {
      expect(1).to.beLessThan(2)
    }
    
  }
  
  func testBeLessThanFail() {
    
    assertTrueValidate(False) {
      expect(2).to.beLessThan(1)
    }
    
  }
  
}
