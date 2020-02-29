import XCTest

import MultiUserTests

var tests = [XCTestCaseEntry]()
tests += MultiUserTests.allTests()
XCTMain(tests)
