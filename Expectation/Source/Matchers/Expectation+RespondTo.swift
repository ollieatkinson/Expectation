//
//  Expectation+RespondTo.swift
//  ExpectationExample
//
//  Created by Atkinson, Oliver (Developer) on 21/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import Foundation

public extension Expectation where T: NSObjectProtocol {
  
  public func respondTo(_ selector: Selector, _ description: String = "") {
    assertTrue(expect?.responds(to: selector) ?? false, self.description(#function, selector, description))
  }
  
}
