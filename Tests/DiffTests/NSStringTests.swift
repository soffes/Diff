//
//  NSStringTests.swift
//  Diff
//
//  Created by Sam Soffes on 5/6/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

import XCTest
import Diff

class NSStringTests: XCTestCase {
	func testInsert() {
		let (range, string) = diff("Hello 🇺🇸 world" as NSString, "Hello there world" as NSString)!
		XCTAssertEqual(6, range.location)
		XCTAssertEqual(4, range.length)
		XCTAssertEqual("there" as NSString, string)
	}
}
