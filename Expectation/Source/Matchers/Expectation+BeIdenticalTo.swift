//
//  Expectation+BeIdenticalTo.swift
//  Expectation
//
//  Created by Oliver Atkinson on 08/12/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

extension Expectation where T: AnyObject {
  
  func beIdenticalTo(other: T, _ description: String = "") {
    assertTrue(expect === other, self.description(__FUNCTION__, other, description))
  }
  
}
