//
//  Expectation+HaveCountOf.swift
//  ExpectationExample
//
//  Created by Atkinson, Oliver (Developer) on 21/02/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

extension Expectation where T: CollectionType {
  
  func haveCountOf(count: T.Index.Distance, description: String = "") {
    assertTrue(expect?.count == count, self.description(__FUNCTION__, count, description))
  }
  
}
