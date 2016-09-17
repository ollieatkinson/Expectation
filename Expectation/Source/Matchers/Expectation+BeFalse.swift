//
//  Expectation+BeFalse.swift
//  Expectation
//
//  Created by Oliver on 15/12/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

public extension Expectation where T: Equatable, T: ExpressibleByBooleanLiteral {

  public func beFalse(_ description: String = "") {
    assertTrue(expect == false, self.description(#function, description))
  }
  
}
