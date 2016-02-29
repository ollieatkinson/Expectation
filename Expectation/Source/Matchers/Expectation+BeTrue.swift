//
//  Expectation+BeTrue.swift
//  Expectation
//
//  Created by Oliver on 24/11/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

public extension Expectation where T: Equatable, T: BooleanLiteralConvertible {
  
  public func beTrue(description: String = "") {
    assertTrue(expect == true, self.description(__FUNCTION__, description))
  }
  
}
