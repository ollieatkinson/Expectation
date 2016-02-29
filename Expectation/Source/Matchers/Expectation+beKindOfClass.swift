//
//  Expectation+BeKindOfClass.swift
//  Expectation
//
//  Created by Oliver on 25/11/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

import Foundation

public extension Expectation where T: NSObjectProtocol {
  
  public func beKindOfClass(klass: AnyClass, _ description: String = "") {
    
    guard let expect = expect else {
      fail(self.description(__FUNCTION__, klass, description))
      return
    }
    
    assertTrue(expect.isKindOfClass(klass), self.description(__FUNCTION__, klass, description))
    
  }
  
}
