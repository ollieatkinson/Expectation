//
//  Expectation.swift
//  Expectation
//
//  Created by Oliver on 24/11/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

import XCTest

public func expect<T>(_ value: T?, file: StaticString = #file, line: UInt = #line) -> Expectation<T> {
  return Expectation(value, file: file, line: line)
}

public func fail(_ reason: String = "", file: StaticString = #file, line: UInt = #line) {
  ExpectationAssertFunctions.fail(reason, file, line)
}

open class Expectation<T> {
  
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
  
  open var to: Expectation {
    description += ".to"
    return self
  }
  
  open var toNot: Expectation {
    
    description += ".toNot"
    invert       = !invert
    
    return self
  }
  
  open var notTo: Expectation {
    
    description += ".notTo"
    invert       = !invert
    
    return self
  }
  
  func description<T>(_ function: String, _ other: T?, _ description: String = "") -> String {
    return self.description + ".\(function)(\((other == nil ? "nil" : "\(other!)")))\(description.isEmpty ? "" : " - \(description)")"
  }
  
  func description(_ function: String, _ description: String = "") -> String {
    return self.description + ".\(function)\(description.isEmpty ? "" : " - \(description)")"
  }
  
  func assertTrue(_ expression: Bool, _ message: String) {
    (invert ? ExpectationAssertFunctions.assertFalse : ExpectationAssertFunctions.assertTrue)(expression, message, file, line)
  }
  
  func assertFalse(_ expression: Bool, _ message: String) {
    (invert ? ExpectationAssertFunctions.assertTrue : ExpectationAssertFunctions.assertFalse)(expression, message, file, line)
  }
  
  func assertNil(_ expression: Any?, _ message: String) {
    (invert ? ExpectationAssertFunctions.assertNotNil : ExpectationAssertFunctions.assertNil)(expression, message, file, line)
  }
  
  func assertNotNil(_ expression: Any?, _ message: String) {
    (invert ? ExpectationAssertFunctions.assertNil : ExpectationAssertFunctions.assertNotNil)(expression, message, file, line)
  }
  
  func fail(_ message: String) {
    ExpectationAssertFunctions.fail(message, file, line)
  }
  
}

open class ExpectationAssertFunctions {
  
  static var assertTrue   = ExpectationAssertFunctions.ExpectationAssertTrue
  static var assertFalse  = ExpectationAssertFunctions.ExpectationAssertFalse
  static var assertNil    = ExpectationAssertFunctions.ExpectationAssertNil
  static var assertNotNil = ExpectationAssertFunctions.ExpectationAssertNotNil
  static var fail         = ExpectationAssertFunctions.ExpectationFail
  
  open static func ExpectationAssertTrue(_ expression: Bool, _ message: String, file: StaticString, line: UInt) -> Void {
    XCTAssertTrue(expression, message, file: file, line: line)
  }
  
  open static func ExpectationAssertFalse(_ expression: Bool, _ message: String, file: StaticString, line: UInt) -> Void {
    XCTAssertFalse(expression, message, file: file, line: line)
  }
  
  open static func ExpectationAssertNil(_ expression: Any?, _ message: String, file: StaticString, line: UInt) -> Void {
    XCTAssertNil(expression, message, file: file, line: line)
  }
  
  open static func ExpectationAssertNotNil(_ expression: Any?, _ message: String, file: StaticString, line: UInt) -> Void {
    XCTAssertNotNil(expression, message, file: file, line: line)
  }
  
  open static func ExpectationFail(_ message: String, file: StaticString, line: UInt) -> Void {
    XCTFail(message, file: file, line: line)
  }
  
}
