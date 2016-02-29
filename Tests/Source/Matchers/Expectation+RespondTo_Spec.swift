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

  override func setUp() {
    super.setUp()
    ExpectationAssertFunctions.assertTrue = XCTAssertTrue
  }
  
  func testRespondToPass() {
    
    assertTrueValidate(True) {
      expect(NSObject()).to.respondTo(Selector("doesNotRecognizeSelector:"))
    }
    
  }
  
  func testRespondToFail() {
    
    assertTrueValidate(False) {
      expect(NSObject()).to.respondTo(Selector("invalidSelector"))
    }
    
    assertTrueValidate(False) {
      let object: NSObject? = nil
      expect(object).to.respondTo(Selector("doesNotRecognizeSelector:"))
    }
    
  }
  
}
