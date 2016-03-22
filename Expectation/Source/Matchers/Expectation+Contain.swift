//
//  Expectation+Contain.swift
//  Expectation
//
//  Created by Oliver Atkinson on 08/12/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

public extension Expectation where T: CollectionType, T.Generator.Element: Equatable {

  public func contain(element: T.Generator.Element, _ description: String = "") {
    assertFalse(expect?.indexOf(element) == nil, self.description(#function, element, description))
  }
  
}
