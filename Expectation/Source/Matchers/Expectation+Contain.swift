//
//  Expectation+Contain.swift
//  Expectation
//
//  Created by Oliver Atkinson on 08/12/2015.
//  Copyright © 2015 Oliver. All rights reserved.
//

extension Expectation where T: CollectionType, T.Generator.Element: Equatable {

  func contain(element: T.Generator.Element, _ description: String = "") {
    assertFalse(expect?.indexOf(element) == nil, self.description(__FUNCTION__, element, description))
  }
  
}
