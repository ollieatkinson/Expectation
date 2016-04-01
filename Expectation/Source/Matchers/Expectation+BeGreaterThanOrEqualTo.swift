//
//  Expectation+BeGreaterThanOrEqualTo.swift
//  Expectation
//
//  Created by Oliver on 15/12/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

public extension Expectation where T: Comparable {
  
  public func beGreaterThanOrEqualTo(other: T, _ description: String = "") {
    assertTrue(expect >= other, self.description(#function, other, description))
  }
  
}
