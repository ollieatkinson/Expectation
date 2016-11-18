//
//  Expectation+HaveCountOf.swift
//  ExpectationExample
//
//  Created by Atkinson, Oliver (Developer) on 21/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

public extension Expectation where T: Collection {
  
  public func haveCountOf(_ count: T.IndexDistance, description: String = "") {
    assertTrue(expect?.count == count, self.description(#function, count, description))
  }
  
}
