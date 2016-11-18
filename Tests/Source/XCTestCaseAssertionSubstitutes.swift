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
  
  typealias AssertBoolean  = (Bool, String, _ file: StaticString, _ line: UInt) -> Void
  typealias AssertOptional = (Any?, String, _ file: StaticString, _ line: UInt) -> Void
  
  
  func True(_ expression: Bool, message: String, file: StaticString, line: UInt) -> Void {
    XCTAssertTrue(expression, message, file: file, line: line)
  }
  
  func False(_ expression: Bool, message: String, file: StaticString, line: UInt) -> Void {
    XCTAssertFalse(expression, message, file: file, line: line)
  }
  
  func Nil(_ expression: Any?, message: String, file: StaticString, line: UInt) -> Void {
    XCTAssertNil(expression, message, file: file, line: line)
  }
  
  func NotNil(_ expression: Any?, message: String, file: StaticString, line: UInt) -> Void {
    XCTAssertNotNil(expression, message, file: file, line: line)
  }
  
  func assertTrueValidate(_ function: @escaping AssertBoolean, expectation: (Void) -> Void) {
    
    let assertTrue = self.expectation(description: "assertTrue is executed")
    
    ExpectationAssertFunctions.assertTrue = { (expression: Bool, message: String, file: StaticString, line: UInt) in
      function(expression, message, file, line)
      assertTrue.fulfill()
    }
    
    ExpectationAssertFunctions.assertFalse = { (expression: Bool, message, file, line) in
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
    
    waitForExpectations(timeout: 1) {
      XCTAssertNil($0)
    }
    
  }
  
  func assertFalseValidate(_ function: @escaping AssertBoolean, expectation: (Void) -> Void) {
    
    let assertFalse = self.expectation(description: "assertFalse is executed")
    
    ExpectationAssertFunctions.assertFalse = { (expression: Bool, message: String, file: StaticString, line: UInt) in
      function(expression, message, file, line)
      assertFalse.fulfill()
    }
    
    ExpectationAssertFunctions.assertTrue = { (expression: Bool, message: String, file: StaticString, line: UInt) in
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
    
    waitForExpectations(timeout: 1) {
      XCTAssertNil($0)
    }
    
  }
  
  func assertNilValidate(_ function: @escaping AssertOptional, expectation: (Void) -> Void) {
    
    let assertNil = self.expectation(description: "assertNil is executed")
    
    ExpectationAssertFunctions.assertNil = { (expression: Any?, message, file, line) in
      function(expression, message, file, line)
      assertNil.fulfill()
    }
    
    ExpectationAssertFunctions.assertTrue = { (expression: Bool, message: String, file: StaticString, line: UInt) in
      XCTFail("assertTrue not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertFalse = { (expression: Bool, message: String, file: StaticString, line: UInt) in
      XCTFail("assertFalse not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertNotNil = { (expression: Any?, message, file, line) in
      XCTFail("assertNotNil not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.fail = { (message, file, line) in
      XCTFail("fail not expected", file: file, line: line)
    }
    
    expectation()
    
    waitForExpectations(timeout: 1) {
      XCTAssertNil($0)
    }
    
  }
  
  func assertNotNilValidate(_ function: @escaping AssertOptional, expectation: (Void) -> Void) {
    
    let assertNotNil = self.expectation(description: "assertNotNil is executed")
    
    ExpectationAssertFunctions.assertNotNil = { (expression: Any?, message, file, line) in
      function(expression, message, file, line)
      assertNotNil.fulfill()
    }
    
    ExpectationAssertFunctions.assertTrue = { (expression: Bool, message: String, file: StaticString, line: UInt) in
      XCTFail("assertTrue not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertFalse = { (expression: Bool, message: String, file: StaticString, line: UInt) in
      XCTFail("assertFalse not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertNil = { (expression: Any?, message, file, line) in
      XCTFail("assertNil not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.fail = { (message, file, line) in
      XCTFail("fail not expected", file: file, line: line)
    }
    
    expectation()
    
    waitForExpectations(timeout: 1) {
      XCTAssertNil($0)
    }
    
  }
  
  func failWithBlock(_ block: (Void) -> Void) {
    
    let fail = expectation(description: "fail is executed")
    
    ExpectationAssertFunctions.fail = { (message, file, line) in
      fail.fulfill()
    }
    
    ExpectationAssertFunctions.assertTrue = { (expression: Bool, message: String, file: StaticString, line: UInt) in
      XCTFail("assertTrue not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertFalse = { (expression: Bool, message: String, file: StaticString, line: UInt) in
      XCTFail("assertFalse not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertNil = { (expression: Any?, message, file, line) in
      XCTFail("assertNil not expected", file: file, line: line)
    }
    
    ExpectationAssertFunctions.assertNotNil = { (expression: Any?, message, file, line) in
      XCTFail("assertNotNil not expected", file: file, line: line)
    }
    
    block()
    
    waitForExpectations(timeout: 1) {
      XCTAssertNil($0)
    }
    
  }
  
}
