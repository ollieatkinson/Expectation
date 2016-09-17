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

  override func tearDown() {
    super.tearDown()
    
    ExpectationAssertFunctions.assertTrue   = ExpectationAssertFunctions.ExpectationAssertTrue
    ExpectationAssertFunctions.assertFalse  = ExpectationAssertFunctions.ExpectationAssertFalse
    ExpectationAssertFunctions.assertNil    = ExpectationAssertFunctions.ExpectationAssertNil
    ExpectationAssertFunctions.assertNotNil = ExpectationAssertFunctions.ExpectationAssertNotNil
    ExpectationAssertFunctions.fail         = ExpectationAssertFunctions.ExpectationFail
    
  }
  
  func testConformToPass() {
    
    assertTrueValidate(True) {
      expect(NSObject()).to.conformTo(NSObjectProtocol.self)
    }
    
  }
  
  func testConformToFail() {
    
    assertTrueValidate(False) {
      expect(NSObject()).to.conformTo(NSFastEnumeration.self)
    }
    
    assertTrueValidate(False) {
      let object: NSObject? = nil
      expect(object).to.conformTo(NSObjectProtocol.self)
    }
    
  }
  
}
