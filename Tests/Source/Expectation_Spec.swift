//
//  Expectation.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 01/04/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_Spec: XCTestCase {
  
  override func tearDown() {
    super.tearDown()
    
    ExpectationAssertFunctions.assertTrue   = ExpectationAssertFunctions.ExpectationAssertTrue
    ExpectationAssertFunctions.assertFalse  = ExpectationAssertFunctions.ExpectationAssertFalse
    ExpectationAssertFunctions.assertNil    = ExpectationAssertFunctions.ExpectationAssertNil
    ExpectationAssertFunctions.assertNotNil = ExpectationAssertFunctions.ExpectationAssertNotNil
    ExpectationAssertFunctions.fail         = ExpectationAssertFunctions.ExpectationFail
    
  }

  func testFunctions() {
    
    ExpectationAssertFunctions.ExpectationAssertTrue(true, "", file: #file, line: #line)
    ExpectationAssertFunctions.ExpectationAssertFalse(false, "", file: #file, line: #line)
    ExpectationAssertFunctions.ExpectationAssertNil(nil, "", file: #file, line: #line)
    ExpectationAssertFunctions.ExpectationAssertNotNil(NSObject(), "", file: #file, line: #line)

  }
  
  func testFailure() {
    
    let failExpectation = expectationWithDescription("should call fail")
    ExpectationAssertFunctions.fail = { message, file, line in
      failExpectation.fulfill()
    }
    
    fail()
    
    waitForExpectationsWithTimeout(1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  struct A {
    
  }
  
  func testAssertTrue() {
    
    let expectation = expect(5)
    
    let assertTrue = expectationWithDescription("assertTrue is called")
    ExpectationAssertFunctions.assertTrue = { expression, message, file, line in
      assertTrue.fulfill()
    }
    
    expectation.to
    expectation.assertTrue(true, "")
    
    waitForExpectationsWithTimeout(1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertTrueInverse() {
    
    let expectation = expect(5)
    
    let assertFalse = expectationWithDescription("assertFalse is called")
    ExpectationAssertFunctions.assertFalse = { expression, message, file, line in
      assertFalse.fulfill()
    }
    
    expectation.toNot
    expectation.assertTrue(true, "")
    
    waitForExpectationsWithTimeout(1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertFalse() {
    
    let expectation = expect(5)
    
    let assertFalse = expectationWithDescription("assertFalse is called")
    ExpectationAssertFunctions.assertFalse = { expression, message, file, line in
      assertFalse.fulfill()
    }
    
    expectation.to
    expectation.assertFalse(true, "message")
    
    waitForExpectationsWithTimeout(1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertFalseInverse() {
    
    let expectation = expect(5)
    
    let assertTrue = expectationWithDescription("assertTrue is called")
    ExpectationAssertFunctions.assertTrue = { expression, message, file, line in
      assertTrue.fulfill()
    }
    
    expectation.toNot
    expectation.assertFalse(true, "")
    
    waitForExpectationsWithTimeout(1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertNil() {
    
    let expectation = expect(5)
    
    
    let assertNil = expectationWithDescription("assertNil is called")
    ExpectationAssertFunctions.assertNil = { expression, message, file, line in
      assertNil.fulfill()
    }
    
    let a: A? = A()
    
    expectation.to
    expectation.assertNil(a, "")
    
    waitForExpectationsWithTimeout(1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertNilInverse() {
    
    let expectation = expect(5)
    
    let assertNotNil = expectationWithDescription("assertNotNil is called")
    ExpectationAssertFunctions.assertNotNil = { expression, message, file, line in
      assertNotNil.fulfill()
    }
    
    let a: A? = A()
    
    expectation.toNot
    expectation.assertNil(a, "")
    
    waitForExpectationsWithTimeout(1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertNotNil() {
    
    let expectation = expect(5)
    
    let assertNotNil = expectationWithDescription("assertNotNil is called")
    ExpectationAssertFunctions.assertNotNil = { expression, message, file, line in
      assertNotNil.fulfill()
    }
    
    let a: A? = A()
    
    expectation.to
    expectation.assertNotNil(a, "")
    
    waitForExpectationsWithTimeout(1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertNotNilInverse() {
    
    let expectation = expect(5)
    
    
    let assertNil = expectationWithDescription("assertNil is called")
    ExpectationAssertFunctions.assertNil = { expression, message, file, line in
      assertNil.fulfill()
    }
    
    let a: A? = A()
    
    expectation.toNot
    expectation.assertNotNil(a, "")
    
    waitForExpectationsWithTimeout(1) {
      XCTAssert($0 == nil)
    }
    
  }

}
