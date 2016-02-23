//
//  Expectation+BeKindOfClass_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeKindOfClass_Spec: XCTestCase {
  
  override func setUp() {
    super.setUp()
    
    ExpectationAssertFunctions.assertTrue  = XCTAssertTrue
    ExpectationAssertFunctions.assertFalse = XCTAssertFalse
    
  }
  
  func testBeKindOfClassPass() {
    
    assertTrueValidate(True) {
      expect(NSObject()).to.beKindOfClass(NSObject)
    }
    
  }
  
  func testBeKindOfClassFail() {
    
    assertTrueValidate(False) {
      expect(NSObject()).to.beKindOfClass(NSFileManager)
    }
    
    assertTrueValidate(False) {
      let value: NSObject? = nil
      expect(value).to.beKindOfClass(NSFileManager)
    }
    
  }
  
  func testBeKindOfClassInverse() {
    
    assertFalseValidate(True) {
      expect(NSObject()).toNot.beKindOfClass(NSObject)
    }
    
  }

}
