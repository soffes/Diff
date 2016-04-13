//
//  DiffTests.swift
//  Diff
//
//  Created by Sam Soffes on 4/12/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

import XCTest
import Diff

class DiffTests: XCTestCase {
	func testInsert() {
		let (range, string) = diff("Hello world", "Hello there world")!
		XCTAssertEqual(6...6, range)
		XCTAssertEqual("there ", string)
	}

	func testRemove() {
		let (range, string) = diff("Hello there world", "Hello world")!
		XCTAssertEqual(6..<12, range)
		XCTAssertEqual("", string)
	}

	func testRemoveFront() {
		let (range, string) = diff("Hello world", "world")!
		XCTAssertEqual(0..<6, range)
		XCTAssertEqual("", string)
	}

	func testSame() {
		XCTAssertNil(diff("Hello", "Hello"))
	}

	func testEmptyLHS() {
		let (range, string) = diff("", "Hello world")!
		XCTAssertEqual(0...0, range)
		XCTAssertEqual("Hello world", string)
	}

	func testEmptyRHS() {
		let (range, string) = diff("Hello world", "")!
		XCTAssertEqual(0..<11, range)
		XCTAssertEqual("", string)
	}

	func testIntArray() {
		let (range, replacement) = diff([1, 2, 3], [1, 2, 3, 4])!
		XCTAssertEqual(3...3, range)
		XCTAssertEqual([4], replacement)
	}

	func testOtherType() {
		let before: [Foo] = [Foo(value: 1), Foo(value: 2)]
		let after: [Foo] = [Foo(value: 2)]

		let (range, replacement) = diff(before, after, compare: Foo.compare)!
		XCTAssertEqual(0...0, range)
		XCTAssertEqual(0, replacement.count)
	}
}
