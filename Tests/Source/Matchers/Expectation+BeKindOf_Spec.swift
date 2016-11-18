//
//  Expectation+BeKindOfClass_Spec.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 23/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_BeKindOf_Spec: XCTestCase {
  
  override func tearDown() {
    super.tearDown()
    
    ExpectationAssertFunctions.assertTrue   = ExpectationAssertFunctions.ExpectationAssertTrue
    ExpectationAssertFunctions.assertFalse  = ExpectationAssertFunctions.ExpectationAssertFalse
    ExpectationAssertFunctions.assertNil    = ExpectationAssertFunctions.ExpectationAssertNil
    ExpectationAssertFunctions.assertNotNil = ExpectationAssertFunctions.ExpectationAssertNotNil
    ExpectationAssertFunctions.fail         = ExpectationAssertFunctions.ExpectationFail
    
  }
  
  struct A {
    
  }
  
  struct B {
    
  }
  
  func testBeKindOfPass() {
    
    assertTrueValidate(True) {
      expect(NSObject()).to.beKindOf(NSObject.self)
    }
    
    assertTrueValidate(True) {
      expect(A()).to.beKindOf(A.self)
    }
    
  }
  
  func testBeKindOfFail() {
    
    assertTrueValidate(False) {
      expect(NSObject()).to.beKindOf(FileManager.self)
    }
    
    assertTrueValidate(False) {
      let value: NSObject? = nil
      expect(value).to.beKindOf(FileManager.self)
    }
    
    assertTrueValidate(False) {
      expect(A()).to.beKindOf(B.self)
    }
    
  }
  
  func testBeKindOfInverse() {
    
    assertFalseValidate(True) {
      expect(NSObject()).toNot.beKindOf(NSObject.self)
    }
    
    assertFalseValidate(True) {
      expect(NSObject()).notTo.beKindOf(NSObject.self)
    }
    
  }

}
