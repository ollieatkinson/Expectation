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
  
  typealias AssertBoolean  = (expression: BooleanType, message: String, file: String, line: UInt) -> Void
  typealias AssertOptional = (expression: Any?,        message: String, file: String, line: UInt) -> Void

  func assertTrueWithExpectation(expectation: Void -> Void, validation: AssertBoolean) {
    
    let assertTrue = expectationWithDescription("assertTrue is executed")
    ExpectationAssertFunctions.assertTrue = { (@autoclosure expression: Void -> BooleanType, message, file, line) in
      validation(expression: expression(), message: message, file: file, line: line)
      assertTrue.fulfill()
    }
    
    expectation()
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func assertFalseWithExpectation(expectation: Void -> Void, validation: AssertBoolean) {
    
    let assertFalse = expectationWithDescription("assertFalse is executed")
    ExpectationAssertFunctions.assertFalse = { (@autoclosure expression: Void -> BooleanType, message, file, line) in
      validation(expression: expression(), message: message, file: file, line: line)
      assertFalse.fulfill()
    }
    
    expectation()
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func assertNilWithExpectation(expectation: Void -> Void, validation: AssertOptional) {
    
    let assertNil = expectationWithDescription("assertNil is executed")
    ExpectationAssertFunctions.assertNil = { (@autoclosure expression: Void -> Any?, message, file, line) in
      validation(expression: expression(), message: message, file: file, line: line)
      assertNil.fulfill()
    }
    
    expectation()
    
    waitForExpectationsWithTimeout(1) {
      XCTAssertNil($0)
    }
    
  }
  
  func assertNotNilWithExpectation(expectation: Void -> Void, validation: AssertOptional) {
    
    let assertNotNil = expectationWithDescription("assertNotNil is executed")
    ExpectationAssertFunctions.assertNotNil = { (@autoclosure expression: Void -> Any?, message, file, line) in
      validation(expression: expression(), message: message, file: file, line: line)
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
