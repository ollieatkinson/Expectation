//
//  Expectation+BeNil.swift
//  Expectation
//
//  Created by Oliver on 24/11/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

extension Expectation {
  
  func beNil(description: String = "") {
    assertNil(expect, self.description(__FUNCTION__, description))
  }
  
}
