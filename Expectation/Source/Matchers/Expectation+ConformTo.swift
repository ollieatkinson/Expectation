//
//  Expectation+ConformTo.swift
//  ExpectationExample
//
//  Created by Atkinson, Oliver (Developer) on 21/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import Foundation

public extension Expectation where T: NSObjectProtocol {

  public func conformTo(_ aProtocol: Protocol, _ description: String = "") {
    assertTrue(expect?.conforms(to: aProtocol) ?? false, self.description(#function, aProtocol, description))
  }
  
}
