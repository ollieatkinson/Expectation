//
//  Expectation+RespondTo_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_RespondTo_Spec: XCTestCase {

  override func tearDown() {
    super.tearDown()
    
    ExpectationAssertFunctions.assertTrue   = ExpectationAssertFunctions.ExpectationAssertTrue
    ExpectationAssertFunctions.assertFalse  = ExpectationAssertFunctions.ExpectationAssertFalse
    ExpectationAssertFunctions.assertNil    = ExpectationAssertFunctions.ExpectationAssertNil
    ExpectationAssertFunctions.assertNotNil = ExpectationAssertFunctions.ExpectationAssertNotNil
    ExpectationAssertFunctions.fail         = ExpectationAssertFunctions.ExpectationFail
    
  }
  
  func testRespondToPass() {
    
    #selector(UIView.frameForAlignmentRect(_:))
    
    assertTrueValidate(True) {
      expect(NSObject()).to.respondTo(#selector(NSObject.doesNotRecognizeSelector(_:)))
    }
    
  }
  
  func testRespondToFail() {
    
    assertTrueValidate(False) {
      expect(NSObject()).to.respondTo(#selector(UIView.layoutSublayersOfLayer(_:)))
    }
    
    assertTrueValidate(False) {
      let object: NSObject? = nil
      expect(object).to.respondTo(#selector(NSObject.doesNotRecognizeSelector(_:)))
    }
    
  }
  
}
