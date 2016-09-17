//
//  Expectation+Contain.swift
//  Expectation
//
//  Created by Oliver Atkinson on 08/12/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

public extension Expectation where T: Collection, T.Iterator.Element: Equatable {

  public func contain(_ element: T.Iterator.Element, _ description: String = "") {
    assertFalse(expect?.index(of: element) == nil, self.description(#function, element, description))
  }
  
}
