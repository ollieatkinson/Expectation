//
//  Expectation+BeKindOfClass.swift
//  Expectation
//
//  Created by Oliver on 25/11/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

import Foundation

public extension Expectation where T: NSObjectProtocol {
  
  func beKindOfClass(klass: AnyClass, _ description: String = "") {
    assertTrue(expect?.isKindOfClass(klass) ?? false, self.description(__FUNCTION__, klass, description))
  }
  
}
