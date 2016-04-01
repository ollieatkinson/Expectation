//
//  Expectation+BeNil_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeNil_Spec: XCTestCase {
  
  override func tearDown() {
    super.tearDown()
    
    ExpectationAssertFunctions.assertTrue   = ExpectationAssertFunctions.ExpectationAssertTrue
    ExpectationAssertFunctions.assertFalse  = ExpectationAssertFunctions.ExpectationAssertFalse
    ExpectationAssertFunctions.assertNil    = ExpectationAssertFunctions.ExpectationAssertNil
    ExpectationAssertFunctions.assertNotNil = ExpectationAssertFunctions.ExpectationAssertNotNil
    ExpectationAssertFunctions.fail         = ExpectationAssertFunctions.ExpectationFail
    
  }
  
  class NilClass {
    
  }
  
  func testBeNilPass() {
    
    assertNilValidate(Nil) {
      let a: NilClass? = nil
      expect(a).to.beNil()
    }
    
  }
  
  func testBeNilFail() {
    
    assertNilValidate(NotNil) {
      expect(NilClass()).to.beNil()
    }
    
  }
  
}
