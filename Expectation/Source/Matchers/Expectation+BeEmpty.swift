//
//  Expectation+BeEmpty.swift
//  ExpectationExample
//
//  Created by Atkinson, Oliver (Developer) on 21/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

public extension Expectation where T: CollectionType {
  
  public func beEmpty(description: String = "") {
    assertTrue(expect?.isEmpty ?? false, self.description(__FUNCTION__, description))
  }
  
}
