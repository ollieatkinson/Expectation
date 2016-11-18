//
//  Expectation+BeEmpty.swift
//  ExpectationExample
//
//  Created by Atkinson, Oliver (Developer) on 21/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

public extension Expectation where T: Collection {
  
  public func beEmpty(_ description: String = "") {
    assertTrue(expect?.isEmpty ?? false, self.description(#function, description))
  }
  
}
