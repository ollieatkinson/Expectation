//
//  Expectation+HavePrefix.swift
//  Expectation
//
//  Created by Oliver Atkinson on 08/12/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

public extension Expectation where T: ExpressibleByStringLiteral {
  
  public func havePrefix(_ other: T, _ description: String = "") {
    
    if let expect = expect {
      assertTrue("\(expect)".hasPrefix("\(other)"), self.description(#function, other, description))
    } else {
      fail(self.description(#function, other, description))
    }
    
  }
  
}
