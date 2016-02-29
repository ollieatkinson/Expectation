//
//  Expectation+BeDynamicType.swift
//  ExpectationExample
//
//  Created by Atkinson, Oliver (Developer) on 21/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

public extension Expectation {
  
  public func beDynamicType<U>(other: U.Type, _ description: String = "") {
    assertTrue(expect.dynamicType == other, self.description(__FUNCTION__, other, description))
  }
  
}
