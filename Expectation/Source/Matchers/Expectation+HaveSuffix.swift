//
//  Expectation+HaveSuffix.swift
//  Expectation
//
//  Created by Oliver on 15/12/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

public extension Expectation where T: StringLiteralConvertible {
  
  public func haveSuffix(other: T, _ description: String = "") {
    
    if let expect = expect {
      assertTrue("\(expect)".hasSuffix("\(other)"), self.description(__FUNCTION__, other, description))
    } else {
      fail(self.description(__FUNCTION__, other, description))
    }
    
  }
  
}
