//
//  Expectation+BeCloseTo.swift
//  Expectation
//
//  Created by Oliver Atkinson on 08/12/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

import CoreGraphics

public protocol DoubleConvertible {
  var doubleValue: Double { get }
}

extension Double: DoubleConvertible {
  
  public var doubleValue: Double {
    return self
  }
  
}

extension Float: DoubleConvertible {
  
  public var doubleValue: Double {
    return Double(self)
  }
  
}

extension CGFloat: DoubleConvertible {
  
  public var doubleValue: Double {
    return Double(self)
  }
  
}

public extension Expectation where T: DoubleConvertible {
  
  public func beCloseTo(other: T, within: T, description: String = "") {
    
    guard let expect = expect else {
      fail(self.description(#function, other, description))
      return
    }
    
    let lowerBound  = expect.doubleValue - within.doubleValue
    let higherBound = expect.doubleValue + within.doubleValue
    
    assertTrue(other.doubleValue >= lowerBound && other.doubleValue <= higherBound, self.description(#function, other, description))
    
  }
  
}
