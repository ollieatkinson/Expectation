//
//  Expectation.swift
//  Expectation
//
//  Created by Oliver on 24/11/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

import XCTest

public func expect<T>(value: T?, file: String = __FILE__, line: UInt = __LINE__) -> Expectation<T> {
  return Expectation(value, file: file, line: line)
}

public func fail(reason: String = "", file: String = __FILE__, line: UInt = __LINE__) {
  XCTFail(reason, file: file, line: line)
}

public class Expectation<T> {
  
  let expect: T?
  var description: String
  var invert = false

  let file: String
  let line: UInt
  
  var fail = XCTFail
  
  init(_ expect: T?,file: String, line: UInt) {
    
    self.expect   = expect
    self.file     = file
    self.line     = line
    
    description = "expect(\(expect == nil ? "nil" : "\(expect!)"))"
  }
  
  var to: Expectation {
    description += ".to"
    return self
  }
  
  var toNot: Expectation {
    
    description += ".toNot"
    invert       = !invert
    
    return self
  }
  
  var notTo: Expectation {
    
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
  
  func assertTrue(@autoclosure expression: () -> BooleanType, _ message: String) {
    (invert ? XCTAssertFalse : XCTAssertTrue)(expression, message, file: file, line: line)
  }
  
  func assertFalse(@autoclosure expression: () -> BooleanType, _ message: String) {
    (invert ? XCTAssertTrue : XCTAssertFalse)(expression, message, file: file, line: line)
  }
  
  func assertNil(@autoclosure expression: () -> Any?, _ message: String) {
    (invert ? XCTAssertNotNil : XCTAssertNil)(expression, message, file: file, line: line)
  }
  
  func assertNotNil(@autoclosure expression: () -> Any?, _ message: String) {
    (invert ? XCTAssertNil : XCTAssertNotNil)(expression, message, file: file, line: line)
  }
  
  func fail(message: String) {
    fail(message, file: file, line: line)
  }
  
}
