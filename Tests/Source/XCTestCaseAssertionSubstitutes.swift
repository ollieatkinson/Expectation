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
  
  typealias AssertBoolean  = (BooleanType, String, file: StaticString, line: UInt) -> Void
  typealias AssertOptional = (Any?, String, file: StaticString, line: UInt) -> Void
  
  
  func True(expression: BooleanType, message: String, file: StaticString, line: UInt) -> Void {
    XCTAssertTrue(expression, message, file: file, line: line)
  }
  
  func False(expression: BooleanType, message: String, file: StaticString, line: UInt) -> Void {
    XCTAssertFalse(expression, message, file: file, line: line)
  }
  
  func Nil(expression: Any?, message: String, file: StaticString, line: UInt) -> Void {
    XCTAssertNil(expression, message, file: file, line: line)
  }
  
  func NotNil(expression: Any?, message: String, file: StaticString, line: UInt) -> Void {
    XCTAssertNotNil(expression, message, file: file, line: line)
  }
  
  func assertTrueValidate(function: AssertBoolean, expectation: Void -> Void) {
    
    let assertTrue = expectationWithDescription("assertTrue is executed")
    
    ExpectationAssertFunctions.assertTrue = { (expression: BooleanType, message: String, file: StaticString, line: UInt) in
      function(expression, message, file: file, line: line)
      assertTrue.fulfill()
    }
    
    ExpectationAssertFunctions.assertFalse = { (expression: BooleanType, message, file, line) in
      XCTFail("assertFalse not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertNil = { (expression: Any?, message, file, line) in
      XCTFail("assertNil not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertNotNil = { (expression: Any?, message, file, line) in
      XCTFail("assertNotNil not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.fail = { (message, file, line) in
      XCTFail("fail not expected", file: file, line: line)
    }
    
    expectation()
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func assertFalseValidate(function: AssertBoolean, expectation: Void -> Void) {
    
    let assertFalse = expectationWithDescription("assertFalse is executed")
    
    ExpectationAssertFunctions.assertFalse = { (expression: BooleanType, message: String, file: StaticString, line: UInt) in
      function(expression, message, file: file, line: line)
      assertFalse.fulfill()
    }
    
    ExpectationAssertFunctions.assertTrue = { (expression: BooleanType, message: String, file: StaticString, line: UInt) in
      XCTFail("assertTrue not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertNil = { (expression: Any?, message, file, line) in
      XCTFail("assertNil not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertNotNil = { (expression: Any?, message, file, line) in
      XCTFail("assertNotNil not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.fail = { (message, file, line) in
      XCTFail("fail not expected", file: file, line: line)
    }
    
    expectation()
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func assertNilValidate(function: AssertOptional, expectation: Void -> Void) {
    
    let assertNil = expectationWithDescription("assertNil is executed")
    
    ExpectationAssertFunctions.assertNil = { (expression: Any?, message, file, line) in
      function(expression, message, file: file, line: line)
      assertNil.fulfill()
    }
    
    ExpectationAssertFunctions.assertTrue = { (expression: BooleanType, message: String, file: StaticString, line: UInt) in
      XCTFail("assertTrue not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertFalse = { (expression: BooleanType, message: String, file: StaticString, line: UInt) in
      XCTFail("assertFalse not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertNotNil = { (expression: Any?, message, file, line) in
      XCTFail("assertNotNil not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.fail = { (message, file, line) in
      XCTFail("fail not expected", file: file, line: line)
    }
    
    expectation()
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func assertNotNilValidate(function: AssertOptional, expectation: Void -> Void) {
    
    let assertNotNil = expectationWithDescription("assertNotNil is executed")
    
    ExpectationAssertFunctions.assertNotNil = { (expression: Any?, message, file, line) in
      function(expression, message, file: file, line: line)
      assertNotNil.fulfill()
    }
    
    ExpectationAssertFunctions.assertTrue = { (expression: BooleanType, message: String, file: StaticString, line: UInt) in
      XCTFail("assertTrue not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertFalse = { (expression: BooleanType, message: String, file: StaticString, line: UInt) in
      XCTFail("assertFalse not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertNil = { (expression: Any?, message, file, line) in
      XCTFail("assertNil not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.fail = { (message, file, line) in
      XCTFail("fail not expected", file: file, line: line)
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
    
    ExpectationAssertFunctions.assertTrue = { (expression: BooleanType, message: String, file: StaticString, line: UInt) in
      XCTFail("assertTrue not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertFalse = { (expression: BooleanType, message: String, file: StaticString, line: UInt) in
      XCTFail("assertFalse not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertNil = { (expression: Any?, message, file, line) in
      XCTFail("assertNil not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertNotNil = { (expression: Any?, message, file, line) in
      XCTFail("assertNotNil not expected", file: file, line: line)
    }
    
    block()
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
}
