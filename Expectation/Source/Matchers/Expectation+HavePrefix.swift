//
//  Expectation+HavePrefix.swift
//  Expectation
//
//  Created by Oliver Atkinson on 08/12/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

extension Expectation where T: StringLiteralConvertible {
  
  func havePrefix(other: T, _ description: String = "") {
    
    guard let expect = expect else {
      fail(self.description(__FUNCTION__, other, description))
      return
    }
    
    assertTrue("\(expect)".hasPrefix("\(other)"), self.description(__FUNCTION__, other, description))
  }
  
}
