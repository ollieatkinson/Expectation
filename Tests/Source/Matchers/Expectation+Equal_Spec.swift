//
//  Expectation+Equal.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 21/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_Equal_Spec: XCTestCase {
  
  override func setUp() {
    super.setUp()
    ExpectationAssertFunctions.assertTrue = XCTAssertTrue
  }
  
  func testEqualPasses() {
    
    assertTrueWithExpectation({
      
      expect(1).to.equal(1)
      
      }, validation: { expression, message, file, line in
        
        XCTAssertTrue(message == "expect(1).to.equal(1)")
        XCTAssertTrue(expression)
        
    })
    
  }
  
  func testEqualFails() {
    
    assertTrueWithExpectation({
      
      expect(1).to.equal(2)
      
      }, validation: { expression, message, file, line in
        
        XCTAssertTrue(message == "expect(1).to.equal(2)")
        XCTAssertFalse(expression)
        
    })
    
  }
    
  func testInverseEqualPasses() {
    
    assertFalseWithExpectation({
      
      expect(1).toNot.equal(2)
      
      }, validation: { expression, message, file, line in
        
        XCTAssertTrue(message == "expect(1).toNot.equal(2)")
        XCTAssertFalse(expression)
        
    })
    
  }
  
  func testInverseEqualFails() {
    
    assertFalseWithExpectation({
      
      expect(1).toNot.equal(1)
      
      }, validation: { expression, message, file, line in
        
        XCTAssertTrue(message == "expect(1).toNot.equal(1)")
        XCTAssertTrue(expression)
        
    })
    
  }
  
  func testArrayEqualPasses() {
    
    assertTrueWithExpectation({
      
      expect([ 1, 2, 3 ]).to.equal([ 1, 2, 3 ])
      
      }, validation: { expression, message, file, line in
        
        XCTAssertTrue(message == "expect([1, 2, 3]).to.equal([1, 2, 3])", message)
        XCTAssertTrue(expression)
        
    })
    
  }
  
  func testArrayEqualFails() {
    
    assertTrueWithExpectation({
      
      expect([ 1, 2 ]).to.equal([ 1, 2, 3 ])
      
      }, validation: { expression, message, file, line in
        
        XCTAssertTrue(message == "expect([1, 2]).to.equal([1, 2, 3])", message)
        XCTAssertFalse(expression)
        
    })
    
  }
  
  func testArrayEqualFailsWithNilInput() {
    
    assertNotNilWithExpectation({
      expect(nil).to.equal([ 1, 2, 3 ])

      }, validation: { expression, message, file, line in
        
        XCTAssertTrue(message == "expect(nil).to.equal([1, 2, 3])", message)
        XCTAssertNil(expression)
        
    })
    
  }
  
}
