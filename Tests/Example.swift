//
//  Tests.swift
//  Tests
//
//  Created by Atkinson, Oliver (Developer) on 21/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Example: XCTestCase {
  
  class Test {
    
  }
  
  func testNil() {
    
    let value: String? = nil
    
    expect(value).to.beNil()
    expect([ ]).toNot.beNil("the empty array should not be nil")
    expect([ ]).toNot.beNil() /// operates the same without a description
    
  }
  
  func testBooleanLiteral() {
    
    expect(true).to.beTrue()
    expect(false).toNot.beTrue()
    
    expect(false).to.beFalse()
    expect(true).toNot.beFalse()
    
  }
  
  func testEquality() {
    
    expect(1).to.equal(1)
    expect(1).toNot.equal(2)
    
  }
  
  func testCollectionTypeEquality() {
    
    expect([ 1, 2 ]).to.equal([ 1, 2 ])
    expect([ 1, 2 ]).toNot.equal([ 1 ])
    
    let value: [Int]? = nil
    
    expect(value).toNot.equal([ 1 ])
    
  }
  
  func testComparable() {
    
    expect(1).to.beLessThan(2)
    expect(1).to.beLessThanOrEqualTo(1)
    expect(1).to.beLessThanOrEqualTo(2)
    
    expect(3).toNot.beLessThan(1)
    expect(3).toNot.beLessThanOrEqualTo(1)
    expect(3).toNot.beLessThanOrEqualTo(2)
    
    expect(5).to.beGreaterThan(4)
    expect(5).to.beGreaterThanOrEqualTo(5)
    expect(5).to.beGreaterThanOrEqualTo(4)
    
    expect(2).toNot.beGreaterThan(3)
    expect(2).toNot.beGreaterThanOrEqualTo(3)
    expect(2).toNot.beGreaterThanOrEqualTo(4)
    
  }
  
  func testBeKindOfClass() {
    
    expect(self).to.beKindOfClass(Example)
    expect(NSObject()).to.beKindOfClass(NSObject)
    expect(1).toNot.beKindOfClass(NSString)
    
    let value: NSNumber? = nil
    
    let expectation = expectationWithDescription("should fail")
    let expectNSNumber = expect(value)
    
    expectNSNumber.fail = { message, file, line in
      expect(message).to.equal("expect(nil).to.beKindOfClass(NSNumber)")
      expectation.fulfill()
    }
    
    expectNSNumber.to.beKindOfClass(NSNumber)
    
    waitForExpectationsWithTimeout(1.0) {
      expect($0).to.beNil()
    }
    
  }
  
  func testCollectionType() {
    
    expect([ "cow", "sheep", "dog" ]).to.contain("cow")
    expect([ "cow", "sheep", "dog" ]).toNot.contain("cat")
    
  }
  
  func testStringLiteralConvertible() {
    
    expect("farm").to.havePrefix("fa")
    expect("farm").toNot.havePrefix("rm")
    
    expect("farm").to.haveSuffix("rm")
    expect("farm").toNot.haveSuffix("fa")
    
  }
  
  func testStringLiteralWithNilValue() {
    
    let value: String? = nil
    
    let expectationHavePrefix = expectationWithDescription("should fail havePrefix")
    let expectHavePrefix = expect(value)
    
    expectHavePrefix.fail = { message, file, line in
      expect(message).to.equal("expect(nil).to.havePrefix(baa)")
      expectationHavePrefix.fulfill()
    }
    
    expectHavePrefix.to.havePrefix("baa")
    
    waitForExpectationsWithTimeout(1.0) {
      expect($0).to.beNil()
    }
    
    let expectationHaveSuffix = expectationWithDescription("should fail haveSuffix")
    let expectHaveSuffix = expect(value)
    
    expectHaveSuffix.fail = { message, file, line in
      expect(message).to.equal("expect(nil).to.haveSuffix(moo)")
      expectationHaveSuffix.fulfill()
    }
    
    expectHaveSuffix.to.haveSuffix("moo")
    
    waitForExpectationsWithTimeout(1.0) {
      expect($0).to.beNil()
    }
    
  }
  
  func testStringLiteralWithNilOther() {
    
    let value: String? = nil
    
    let expectationHavePrefix = expectationWithDescription("should fail havePrefix")
    let expectHavePrefix = expect(value)
    
    expectHavePrefix.fail = { message, file, line in
      expect(message).to.equal("expect(nil).to.havePrefix(baa)")
      expectationHavePrefix.fulfill()
    }
    
    expectHavePrefix.to.havePrefix("baa")
    
    waitForExpectationsWithTimeout(1.0) {
      expect($0).to.beNil()
    }
    
    let expectationHaveSuffix = expectationWithDescription("should fail haveSuffix")
    let expectHaveSuffix = expect(value)
    
    expectHaveSuffix.fail = { message, file, line in
      expect(message).to.equal("expect(nil).to.haveSuffix(moo)")
      expectationHaveSuffix.fulfill()
    }
    
    expectHaveSuffix.to.haveSuffix("moo")
    
    waitForExpectationsWithTimeout(1.0) {
      expect($0).to.beNil()
    }
    
  }
  
  func testIdentical() {
    
    let test = Test()
    
    expect(test).to.beIdenticalTo(test)
    expect(test).toNot.beIdenticalTo(Test())
    
  }
  
  func testToBeCloseTo() {
    
    expect(Double(1.2)).to.beCloseTo(1, within: 0.2)
    expect(Double(1.2)).toNot.beCloseTo(1, within: 0.1)
    
    expect(Float(1.1)).to.beCloseTo(1, within: 0.2)
    expect(Float(1.2)).toNot.beCloseTo(1, within: 0.1)
    
    expect(CGFloat(1.2)).to.beCloseTo(1, within: 0.3)
    expect(CGFloat(1.2)).toNot.beCloseTo(1, within: 0.1)
    
    expect(Float80(1.2)).to.beCloseTo(1, within: 0.2)
    expect(Float80(1.2)).toNot.beCloseTo(1, within: 0.1)
    
    let expectationShouldFail = expectationWithDescription("should fail beCloseTo")
    
    let float: Float? = nil
    let expectation   = expect(float)
    
    expectation.fail = { message, file, line in
      expectationShouldFail.fulfill()
    }
    
    expectation.to.beCloseTo(1, within: 0.2)
    
    waitForExpectationsWithTimeout(1.0) {
      expect($0).to.beNil()
    }
    
  }
  
}
