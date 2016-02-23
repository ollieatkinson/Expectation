//
//  Expectation+ConformTo_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_ConformTo_Spec: XCTestCase {

  override func setUp() {
    super.setUp()
    ExpectationAssertFunctions.assertTrue = XCTAssertTrue
  }
  
  func testConformToPass() {
    
    assertTrueValidate(True) {
      expect(NSObject()).to.conformTo(NSObjectProtocol)
    }
    
  }
  
  func testConformToFail() {
    
    assertTrueValidate(False) {
      expect(NSObject()).to.conformTo(NSFastEnumeration)
    }
    
    assertTrueValidate(False) {
      let object: NSObject? = nil
      expect(object).to.conformTo(NSObjectProtocol)
    }
    
  }
  
}
