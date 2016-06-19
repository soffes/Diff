//
//  Diff+NSString.swift
//  Diff
//
//  Created by Sam Soffes on 5/6/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

import Foundation

public func diff(before: NSString, _ after: NSString) -> (NSRange, NSString)? {
	let result = diff(Array(before.characters), Array(after.characters))
	return result.flatMap { range, characters in
		let string = NSString(characters: characters, length: characters.count)
		return (NSRange(range), string)
	}
}


extension NSString {
	var characters: [unichar] {
		var characters = [unichar]()
		
		for i in 0..<length {
			characters.append(characterAtIndex(i))
		}
		
		return characters
	}
}
