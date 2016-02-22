//
//  Expectation+BeCloseTo_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 22/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeCloseTo_Spec: XCTestCase {
  
  override func setUp() {
    super.setUp()
    ExpectationAssertFunctions.assertTrue = XCTAssertTrue
    ExpectationAssertFunctions.fail       = XCTFail
  }
  
  func testBeCloseToNilInput() {
    
    failWithBlock {
      expect(nil).to.beCloseTo(1, within: 0.3)
    }
    
  }
  
  func testBeCloseToSuccessful() {
    
    assertTrueWithExpectation({
      expect(1.2).to.beCloseTo(1.0, within: 0.3)
    }, validation: { expression, message, file, line in
      XCTAssertTrue(expression)
    })
    
  }
  
  func testBeCloseToFailure() {
    
    assertTrueWithExpectation({
      expect(1.2).to.beCloseTo(1.0, within: 0.1)
    }, validation: { expression, message, file, line in
        XCTAssertFalse(expression)
    })
    
  }
  
  func testBeCloseToFloat() {
    
    assertTrueWithExpectation({
      expect(Float(1.2)).to.beCloseTo(1.0, within: 0.3)
    }, validation: { expression, message, file, line in
        XCTAssertTrue(expression)
    })
    
  }
  
  func testBeCloseToFloat80() {
    
    assertTrueWithExpectation({
      
      expect(Float80(1.2)).to.beCloseTo(1.0, within: 0.3)
      
    }, validation: { expression, message, file, line in
      
        XCTAssertTrue(expression)
      
    })
    
  }
  
  func testBeCloseToCGFloat() {
    
    assertTrueWithExpectation({
      expect(CGFloat(1.2)).to.beCloseTo(1.0, within: 0.3)
    }, validation: { expression, message, file, line in
        XCTAssertTrue(expression)
    })
    
  }

}
