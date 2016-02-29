//
//  Expectation+Equal.swift
//  Expectation
//
//  Created by Oliver on 24/11/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

public extension Expectation where T: Equatable {
  
  public func equal(other: T, _ description: String = "") {
    assertTrue(expect == other, self.description(__FUNCTION__, other, description))
  }
  
}

public extension Expectation where T: CollectionType, T.Generator.Element: Equatable {
  
  public func equal(other: T, _ description: String = "") {
    
    if let expect = expect {
      assertTrue(Array(expect) == Array(other), self.description(__FUNCTION__, other, description))
    } else {
      assertNotNil(nil, self.description(__FUNCTION__, other, description))
    }
    
  }
  
}
