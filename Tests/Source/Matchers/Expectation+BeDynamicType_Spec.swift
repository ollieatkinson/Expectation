//
//  Expectation+BeDynamicType_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeDynamicType_Spec: XCTestCase {

  override func setUp() {
    super.setUp()
    
    ExpectationAssertFunctions.assertTrue = XCTAssertTrue
    
  }
  
  struct Struct {
    
  }
  
  class Class {
    
  }
  
  func testBeDynamicTypePass() {
    
    assertTrueValidate(True) {
      expect(Struct()).to.beDynamicType(Struct.self)
    }
    
    assertTrueValidate(True) {
      expect(Class()).to.beDynamicType(Class.self)
    }
    
  }
  
  func testBeDynamicTypeFail() {
    
    assertTrueValidate(False) {
      expect(Struct()).to.beDynamicType(Class.self)
    }
    
    assertTrueValidate(False) {
      expect(Class()).to.beDynamicType(Struct.self)
    }
    
  }

}
