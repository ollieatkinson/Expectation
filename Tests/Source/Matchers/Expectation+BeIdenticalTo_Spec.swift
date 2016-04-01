//
//  Expectation+BeIdenticalTo_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeIdenticalTo_Spec: XCTestCase {

  override func tearDown() {
    super.tearDown()
    
    ExpectationAssertFunctions.assertTrue   = ExpectationAssertFunctions.ExpectationAssertTrue
    ExpectationAssertFunctions.assertFalse  = ExpectationAssertFunctions.ExpectationAssertFalse
    ExpectationAssertFunctions.assertNil    = ExpectationAssertFunctions.ExpectationAssertNil
    ExpectationAssertFunctions.assertNotNil = ExpectationAssertFunctions.ExpectationAssertNotNil
    ExpectationAssertFunctions.fail         = ExpectationAssertFunctions.ExpectationFail
    
  }
  
  class X {
    
  }
  
  class Y {
    
  }
  
  func testBeIdenticalToPass() {
    
    assertTrueValidate(True) {
      let x = X()
      expect(x).to.beIdenticalTo(x)
    }
    
    assertTrueValidate(True) {
      let y = Y()
      expect(y).to.beIdenticalTo(y)
    }
    
  }
  
  func testBeIdenticalToFail() {
    
    assertTrueValidate(False) {
      expect(X()).to.beIdenticalTo(X())
    }
    
    assertTrueValidate(False) {
      expect(Y()).to.beIdenticalTo(Y())
    }
    
  }

}
