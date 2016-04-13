//
//  Diff.swift
//  Diff
//
//  Created by Sam Soffes on 4/12/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

public func diff(lhs: String, _ rhs: String) -> (Range<Int>, String)? {
	let result = diff(Array(lhs.characters), Array(rhs.characters))
	return result.flatMap { ($0.0, String($0.1)) }
}

public func diff<T: Equatable>(lhs: [T], _ rhs: [T]) -> (Range<Int>, [T])? {
	return diff(lhs, rhs, compare: ==)
}

public func diff<T>(lhs: [T], _ rhs: [T], compare: (T, T) -> Bool) -> (Range<Int>, [T])? {
	let lhsCount = lhs.count
	let rhsCount = rhs.count

	// Find start
	var commonStart = 0
	while commonStart < lhsCount && commonStart < rhsCount && compare(lhs[commonStart], rhs[commonStart]) {
		commonStart += 1
	}

	// Find end
	var commonEnd = 0
	while commonEnd + commonStart < lhsCount && commonEnd + commonStart < rhsCount && compare(lhs[lhsCount - 1 - commonEnd], rhs[rhsCount - 1 - commonEnd]) {
		commonEnd += 1
	}

	// Remove
	if lhsCount != commonStart + commonEnd {
		let range = commonStart..<(lhsCount - commonEnd)
		return (range, [])
	}

	// Insert
	if rhsCount != commonStart + commonEnd {
		let range = commonStart..<(rhsCount - commonEnd)
		return (commonStart...commonStart, Array(rhs[range]))
	}

	// Already equal
	return nil
}
