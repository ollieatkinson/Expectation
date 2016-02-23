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
    
    assertTrueValidate(False) {
      expect(false).to.beFalse()
    }
    
  }
  
  func testBeFalseFail() {
    
    assertTrueValidate(False) {
      expect(true).to.beFalse()
    }
    
  }
  
  func testBeFalsePassInverted() {
    
    assertTrueValidate(False) {
      expect(true).to.beFalse()
    }
    
  }
  
}
