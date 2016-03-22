//
//  Expectation.swift
//  Expectation
//
//  Created by Oliver on 24/11/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

import XCTest

public func expect<T>(value: T?, file: StaticString = #file, line: UInt = #line) -> Expectation<T> {
  return Expectation(value, file: file, line: line)
}

public func fail(reason: String = "", file: StaticString = #file, line: UInt = #line) {
  ExpectationAssertFunctions.fail(reason, file: file, line: line)
}

public class ExpectationAssertFunctions {
  static var assertTrue   = XCTAssertTrue
  static var assertFalse  = XCTAssertFalse
  static var assertNil    = XCTAssertNil
  static var assertNotNil = XCTAssertNotNil
  static var fail         = XCTFail
}

public class Expectation<T> {
  
  let expect: T?
  var description: String
  var invert = false

  let file: StaticString
  let line: UInt
  
  init(_ expect: T?, file: StaticString, line: UInt) {
    
    self.expect   = expect
    self.file     = file
    self.line     = line
    
    description = "expect(\(expect == nil ? "nil" : "\(expect!)"))"
  }
  
  public var to: Expectation {
    description += ".to"
    return self
  }
  
  public var toNot: Expectation {
    
    description += ".toNot"
    invert       = !invert
    
    return self
  }
  
  public var notTo: Expectation {
    
    description += ".notTo"
    invert       = !invert
    
    return self
  }
  
  func description<T>(function: String, _ other: T?, _ description: String = "") -> String {
    return self.description + ".\(function)(\((other == nil ? "nil" : "\(other!)")))\(description.isEmpty ? "" : " - \(description)")"
  }
  
  func description(function: String, _ description: String = "") -> String {
    return self.description + ".\(function)\(description.isEmpty ? "" : " - \(description)")"
  }
  
  func assertTrue(expression: BooleanType, _ message: String) {
    (invert ? ExpectationAssertFunctions.assertFalse : ExpectationAssertFunctions.assertTrue)(expression, message, file: file, line: line)
  }
  
  func assertFalse(expression: BooleanType, _ message: String) {
    (invert ? ExpectationAssertFunctions.assertTrue : ExpectationAssertFunctions.assertFalse)(expression, message, file: file, line: line)
  }
  
  func assertNil(expression: Any?, _ message: String) {
    (invert ? ExpectationAssertFunctions.assertNotNil : ExpectationAssertFunctions.assertNil)(expression, message, file: file, line: line)
  }
  
  func assertNotNil(expression: Any?, _ message: String) {
    (invert ? ExpectationAssertFunctions.assertNil : ExpectationAssertFunctions.assertNotNil)(expression, message, file: file, line: line)
  }
  
  func fail(message: String) {
    ExpectationAssertFunctions.fail(message, file: file, line: line)
  }
  
}
