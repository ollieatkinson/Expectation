//
//  XCTestCaseAssertionSubstitutes.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 22/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

extension XCTestCase {
    
  typealias AssertBoolean  = (BooleanType, String, file: String, line: UInt) -> Void
  typealias AssertOptional = (Any?, String, file: String, line: UInt) -> Void
  
  func True(expression: BooleanType, message: String, file: String, line: UInt) -> Void {
    XCTAssertTrue(expression, message, file: file, line: line)
  }
  
  func False(expression: BooleanType, message: String, file: String, line: UInt) -> Void {
    XCTAssertFalse(expression, message, file: file, line: line)
  }
  
  func Nil(expression: Any?, message: String, file: String, line: UInt) -> Void {
    XCTAssertNil(expression, message, file: file, line: line)
  }
  
  func NotNil(expression: Any?, message: String, file: String, line: UInt) -> Void {
    XCTAssertNotNil(expression, message, file: file, line: line)
  }
  
  func assertTrueValidate(function: AssertBoolean, expectation: Void -> Void) {
    
    let assertTrue = expectationWithDescription("assertTrue is executed")
    ExpectationAssertFunctions.assertTrue = { (@autoclosure expression: Void -> BooleanType, message, file, line) in
      function(expression(), message, file: file, line: line)
      assertTrue.fulfill()
    }
    
    expectation()
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func assertFalseValidate(function: AssertBoolean, expectation: Void -> Void) {
    
    let assertFalse = expectationWithDescription("assertFalse is executed")
    ExpectationAssertFunctions.assertFalse = { (@autoclosure expression: Void -> BooleanType, message, file, line) in
      function(expression(), message, file: file, line: line)
      assertFalse.fulfill()
    }
    
    expectation()
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func assertNilValidate(function: AssertOptional, expectation: Void -> Void) {
    
    let assertNil = expectationWithDescription("assertNil is executed")
    ExpectationAssertFunctions.assertNil = { (@autoclosure expression: Void -> Any?, message, file, line) in
      function(expression(), message, file: file, line: line)
      assertNil.fulfill()
    }
    
    expectation()
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func assertNotNilValidate(function: AssertOptional, expectation: Void -> Void) {
    
    let assertNotNil = expectationWithDescription("assertNotNil is executed")
    ExpectationAssertFunctions.assertNotNil = { (@autoclosure expression: Void -> Any?, message, file, line) in
      function(expression(), message, file: file, line: line)
      assertNotNil.fulfill()
    }
    
    expectation()
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func failWithBlock(block: Void -> Void) {
    
    let fail = expectationWithDescription("fail is executed")
    ExpectationAssertFunctions.fail = { (message, file, line) in
      fail.fulfill()
    }
    
    block()
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
}
