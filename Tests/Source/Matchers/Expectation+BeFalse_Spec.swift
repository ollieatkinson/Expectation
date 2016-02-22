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
  
  func testBeFalsePass() {
    
    assertTrueWithExpectation({
      expect(false).to.beFalse()
      }, validation: { expression, message, file, line in
        XCTAssertTrue(expression)
    })
    
  }
  
  func testBeFalseFail() {
    
    assertTrueWithExpectation({
      expect(true).to.beFalse()
      }, validation: { expression, message, file, line in
        XCTAssertFalse(expression)
    })
    
  }
  
  func testBeFalsePassInverted() {
    
    assertFalseWithExpectation({
      expect(true).toNot.beFalse()
      }, validation: { expression, message, file, line in
        XCTAssertFalse(expression)
    })
    
  }
  
}
