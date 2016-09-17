//
//  Expectation+HaveSuffix.swift
//  Expectation
//
//  Created by Oliver on 15/12/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

public extension Expectation where T: ExpressibleByStringLiteral {
  
  public func haveSuffix(_ other: T, _ description: String = "") {
    
    if let expect = expect {
      assertTrue("\(expect)".hasSuffix("\(other)"), self.description(#function, other, description))
    } else {
      fail(self.description(#function, other, description))
    }
    
  }
  
}
