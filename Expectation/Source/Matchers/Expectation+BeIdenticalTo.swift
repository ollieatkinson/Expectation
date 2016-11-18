//
//  Expectation+BeIdenticalTo.swift
//  Expectation
//
//  Created by Oliver Atkinson on 08/12/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

public extension Expectation where T: AnyObject {
  
  public func beIdenticalTo(_ other: T, _ description: String = "") {
    assertTrue(expect === other, self.description(#function, other, description))
  }
  
}
