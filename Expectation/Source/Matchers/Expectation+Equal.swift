//
//  Expectation+Equal.swift
//  Expectation
//
//  Created by Oliver on 24/11/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

public extension Expectation where T: Equatable {
  
  public func equal(_ other: T, _ description: String = "") {
    assertTrue(expect == other, self.description(#function, other, description))
  }
  
}

public extension Expectation where T: Collection, T.Iterator.Element: Equatable {
  
  public func equal(_ other: T, _ description: String = "") {
    
    if let expect = expect {
      assertTrue(Array(expect) == Array(other), self.description(#function, other, description))
    } else {
      fail(self.description(#function, other, description))
    }
    
  }
  
}
