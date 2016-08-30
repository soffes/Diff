//
//  Diff.swift
//  Diff
//
//  Created by Sam Soffes on 4/12/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

public func diff(_ before: String, _ after: String) -> (CountableRange<Int>, String)? {
	let result = diff(Array(before.characters), Array(after.characters))
	return result.flatMap { ($0.0, String($0.1)) }
}

public func diff<T: Equatable>(_ before: [T], _ after: [T]) -> (CountableRange<Int>, [T])? {
	return diff(before, after, compare: ==)
}

public func diff<T>(_ before: [T], _ after: [T], compare: (T, T) -> Bool) -> (CountableRange<Int>, [T])? {
	let beforeCount = before.count
	let afterCount = after.count

	// Find start
	var commonStart = 0
	while commonStart < beforeCount && commonStart < afterCount && compare(before[commonStart], after[commonStart]) {
		commonStart += 1
	}

	// Find end
	var commonEnd = 0
	while commonEnd + commonStart < beforeCount && commonEnd + commonStart < afterCount && compare(before[beforeCount - 1 - commonEnd], after[afterCount - 1 - commonEnd]) {
		commonEnd += 1
	}

	// Remove
	if beforeCount != commonStart + commonEnd {
		let range = commonStart..<(beforeCount - commonEnd)
		let intersection = commonStart..<(afterCount - commonEnd)
		return (range, Array(after[intersection]))
	}

	// Insert
	if afterCount != commonStart + commonEnd {
		let range = commonStart..<(afterCount - commonEnd)
		return (commonStart..<commonStart, Array(after[range]))
	}

	// Already equal
	return nil
}
