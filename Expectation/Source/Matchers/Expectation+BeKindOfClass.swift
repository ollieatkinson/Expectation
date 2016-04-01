//
//  Expectation+BeKindOfClass.swift
//  Expectation
//
//  Created by Oliver on 25/11/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

import Foundation

public extension Expectation {
  
  func beKindOf<T>(klass: T.Type, _ description: String = "") {
    assertTrue(expect is T, self.description(#function, klass, description))
  }
  
}
