//
//  Expectation+HaveSuffix_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_HaveSuffix_Spec: XCTestCase {
  
  override func setUp() {
    super.setUp()
    
    ExpectationAssertFunctions.assertTrue = XCTAssertTrue
    ExpectationAssertFunctions.fail       = XCTFail
    
  }
  
  func testHavePrefixPass() {
    
    assertTrueValidate(True) {
      expect("exp_string").to.haveSuffix("string")
    }
    
  }
  
  func testHavePrefixFail() {
    
    failWithBlock {
      let string: String? = nil
      expect(string).to.haveSuffix("string")
    }
    
  }
  
}