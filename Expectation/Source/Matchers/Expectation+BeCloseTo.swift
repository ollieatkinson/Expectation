//
//  Expectation+BeCloseTo.swift
//  Expectation
//
//  Created by Oliver Atkinson on 08/12/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

import CoreGraphics

protocol DoubleConvertible {
  var doubleValue: Double { get }
}

extension Double: DoubleConvertible {
  
  var doubleValue: Double {
    return self
  }
  
}

extension Float: DoubleConvertible {
  
  var doubleValue: Double {
    return Double(self)
  }
  
}

extension Float80: DoubleConvertible {
  
  var doubleValue: Double {
    return Double(self)
  }
  
}

extension CGFloat: DoubleConvertible {
  
  var doubleValue: Double {
    return Double(self)
  }
  
}

extension Expectation where T: DoubleConvertible {
  
  func beCloseTo(other: T, within: T, description: String = "") {
    
    guard let expect = expect else {
      fail(self.description(__FUNCTION__, other, description))
      return
    }
    
    let lowerBound  = expect.doubleValue - within.doubleValue
    let higherBound = expect.doubleValue + within.doubleValue
    
    assertTrue(other.doubleValue >= lowerBound && other.doubleValue <= higherBound, self.description(__FUNCTION__, "\(other) lower: \(lowerBound), higher: \(higherBound)", description))
    
  }
  
}
