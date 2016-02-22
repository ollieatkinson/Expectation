//
//  Expectation+Equal.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 21/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_Equal: XCTestCase {
  
  override func setUp() {
    super.setUp()
    ExpectationAssertFunctions.assertTrue = XCTAssertTrue
  }
  
  func testEqualPasses() {
    
    let assertTrue = expectationWithDescription("assertTrue is executed and the expression succeeds")
    
    ExpectationAssertFunctions.assertTrue = { (@autoclosure expression: Void -> BooleanType, message, file, line) in
      
      XCTAssertTrue(message == "expect(1).to.equal(1)")
      XCTAssertTrue(expression())
      
      assertTrue.fulfill()
    }
    
    expect(1).to.equal(1)
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func testEqualFails() {
    
    let assertTrue = expectationWithDescription("assertTrue is executed and the expression fails")
    
    ExpectationAssertFunctions.assertTrue = { (@autoclosure expression: Void -> BooleanType, message, file, line) in
      
      XCTAssertTrue(message == "expect(1).to.equal(2)")
      XCTAssertFalse(expression())
      
      assertTrue.fulfill()
    }
    
    expect(1).to.equal(2)
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
    
  func testInverseEqualPasses() {
    
    let assertFalse = expectationWithDescription("assertFalse is executed and the expression succeeds")
    
    ExpectationAssertFunctions.assertFalse = { (@autoclosure expression: Void -> BooleanType, message, file, line) in
      
      XCTAssertTrue(message == "expect(1).toNot.equal(2)")
      XCTAssertFalse(expression())
      
      assertFalse.fulfill()
    }
    
    expect(1).toNot.equal(2)
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func testInverseEqualFails() {
    
    let assertFalse = expectationWithDescription("assertFalse is executed and the expression fails")
    
    ExpectationAssertFunctions.assertFalse = { (@autoclosure expression: Void -> BooleanType, message, file, line) in
      
      XCTAssertTrue(message == "expect(1).toNot.equal(1)")
      XCTAssertTrue(expression())
      
      assertFalse.fulfill()
    }
    
    expect(1).toNot.equal(1)
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func testArrayEqualPasses() {
    
    let assertTrue = expectationWithDescription("assertTrue is executed and the expression succeeds")
    
    ExpectationAssertFunctions.assertTrue = { (@autoclosure expression: Void -> BooleanType, message, file, line) in
      
      XCTAssertTrue(message == "expect([1, 2, 3]).to.equal([1, 2, 3])", message)
      XCTAssertTrue(expression())
      
      assertTrue.fulfill()
    }
    
    expect([ 1, 2, 3 ]).to.equal([ 1, 2, 3 ])
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func testArrayEqualFails() {
    
    let assertTrue = expectationWithDescription("assertTrue is executed and the expression succeeds")
    
    ExpectationAssertFunctions.assertTrue = { (@autoclosure expression: Void -> BooleanType, message, file, line) in
      
      XCTAssertTrue(message == "expect([1, 2]).to.equal([1, 2, 3])", message)
      XCTAssertFalse(expression())
      
      assertTrue.fulfill()
    }
    
    expect([ 1, 2 ]).to.equal([ 1, 2, 3 ])
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func testArrayEqualFailsWithNilInput() {
    
    let assertNotNil = expectationWithDescription("assertNotNil is executed and the expression fails")
    
    ExpectationAssertFunctions.assertNotNil = { (@autoclosure expression: Void -> Any?, message, file, line) in
      
      XCTAssertTrue(message == "expect(nil).to.equal([1, 2, 3])", message)
      XCTAssertNil(expression())
      
      assertNotNil.fulfill()
    }
    
    
    expect(nil).to.equal([ 1, 2, 3 ])
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
}
