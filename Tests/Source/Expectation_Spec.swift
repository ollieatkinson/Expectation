//
//  Expectation.swift
//  Expectation
//
//  Created by Atkinson, Oliver (Developer) on 01/04/2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import XCTest
@testable import Expectation

class Expectation_Spec: XCTestCase {

  func testFunctions() {
    
    ExpectationAssertFunctions.ExpectationAssertTrue(true, "", file: #file, line: #line)
    ExpectationAssertFunctions.ExpectationAssertFalse(false, "", file: #file, line: #line)
    ExpectationAssertFunctions.ExpectationAssertNil(nil, "", file: #file, line: #line)
    ExpectationAssertFunctions.ExpectationAssertNotNil(NSObject(), "", file: #file, line: #line)

  }

}
