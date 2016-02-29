//
//  Expectation+BeNil.swift
//  Expectation
//
//  Created by Oliver on 24/11/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

public extension Expectation {
  
  public func beNil(description: String = "") {
    assertNil(expect, self.description(__FUNCTION__, description))
  }
  
}
