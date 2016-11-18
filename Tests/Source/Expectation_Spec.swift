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
    
    let failExpectation = expectation(description: "should call fail")
    ExpectationAssertFunctions.fail = { message, file, line in
      failExpectation.fulfill()
    }
    
    fail()
    
    waitForExpectations(timeout: 1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  struct A {
    
  }
  
  func testAssertTrue() {
    
    let expectation = expect(5)
    
    let assertTrue = self.expectation(description: "assertTrue is called")
    ExpectationAssertFunctions.assertTrue = { expression, message, file, line in
      assertTrue.fulfill()
    }
    
    _ = expectation.to
    expectation.assertTrue(true, "")
    
    waitForExpectations(timeout: 1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertTrueInverse() {
    
    let expectation = expect(5)
    
    let assertFalse = self.expectation(description: "assertFalse is called")
    ExpectationAssertFunctions.assertFalse = { expression, message, file, line in
      assertFalse.fulfill()
    }
    
    _ = expectation.toNot
    expectation.assertTrue(true, "")
    
    waitForExpectations(timeout: 1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertFalse() {
    
    let expectation = expect(5)
    
    let assertFalse = self.expectation(description: "assertFalse is called")
    ExpectationAssertFunctions.assertFalse = { expression, message, file, line in
      assertFalse.fulfill()
    }
    
    _ = expectation.to
    expectation.assertFalse(true, "message")
    
    waitForExpectations(timeout: 1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertFalseInverse() {
    
    let expectation = expect(5)
    
    let assertTrue = self.expectation(description: "assertTrue is called")
    ExpectationAssertFunctions.assertTrue = { expression, message, file, line in
      assertTrue.fulfill()
    }
    
    _ = expectation.toNot
    expectation.assertFalse(true, "")
    
    waitForExpectations(timeout: 1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertNil() {
    
    let expectation = expect(5)
    
    
    let assertNil = self.expectation(description: "assertNil is called")
    ExpectationAssertFunctions.assertNil = { expression, message, file, line in
      assertNil.fulfill()
    }
    
    let a: A? = A()
    
    _ = expectation.to
    expectation.assertNil(a, "")
    
    waitForExpectations(timeout: 1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertNilInverse() {
    
    let expectation = expect(5)
    
    let assertNotNil = self.expectation(description: "assertNotNil is called")
    ExpectationAssertFunctions.assertNotNil = { expression, message, file, line in
      assertNotNil.fulfill()
    }
    
    let a: A? = A()
    
    _ = expectation.toNot
    expectation.assertNil(a, "")
    
    waitForExpectations(timeout: 1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertNotNil() {
    
    let expectation = expect(5)
    
    let assertNotNil = self.expectation(description: "assertNotNil is called")
    ExpectationAssertFunctions.assertNotNil = { expression, message, file, line in
      assertNotNil.fulfill()
    }
    
    let a: A? = A()
    
    _ = expectation.to
    expectation.assertNotNil(a, "")
    
    waitForExpectations(timeout: 1) {
      XCTAssert($0 == nil)
    }
    
  }
  
  func testAssertNotNilInverse() {
    
    let expectation = expect(5)
    
    
    let assertNil = self.expectation(description: "assertNil is called")
    ExpectationAssertFunctions.assertNil = { expression, message, file, line in
      assertNil.fulfill()
    }
    
    let a: A? = A()
    
    _ = expectation.toNot
    expectation.assertNotNil(a, "")
    
    waitForExpectations(timeout: 1) {
      XCTAssert($0 == nil)
    }
    
  }

}
