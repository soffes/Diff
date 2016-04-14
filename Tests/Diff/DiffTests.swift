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
		XCTAssertEqual(6..<6, range)
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

	func testEmptyBefore() {
		let (range, string) = diff("", "Hello world")!
		XCTAssertEqual(0..<0, range)
		XCTAssertEqual("Hello world", string)
	}

	func testEmptyAfter() {
		let (range, string) = diff("Hello world", "")!
		XCTAssertEqual(0..<11, range)
		XCTAssertEqual("", string)
	}

	func testIntArray() {
		let (range, replacement) = diff([1, 2, 3], [1, 2, 3, 4])!
		XCTAssertEqual(3..<3, range)
		XCTAssertEqual([4], replacement)
	}

	func testReplace() {
		let (range, string) = diff([1, 2, 3, 4], [1, 5, 6, 7, 4])!
		XCTAssertEqual(1..<3, range)
		XCTAssertEqual([5, 6, 7], string)
	}

	func testReplaceAppend() {
		let (range, string) = diff([1, 2], [1, 3, 4])!
		XCTAssertEqual(1..<2, range)
		XCTAssertEqual([3, 4], string)
	}

	func testOtherType() {
		let before: [Foo] = [Bar(value: 1), Bar(value: 2)]
		let after: [Foo] = [Bar(value: 2)]

		let (range, replacement) = diff(before, after, compare: compareFoo)!
		XCTAssertEqual(0..<1, range)
		XCTAssertEqual(0, replacement.count)
	}
}
