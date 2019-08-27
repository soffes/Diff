import Foundation

public func diff(_ before: NSString, _ after: NSString) -> (NSRange, NSString)? {
	let result = diff(Array(before.characters), Array(after.characters))
	return result.flatMap { range, characters in
		let string = NSString(characters: characters, length: characters.count)
		return (NSRange(location: range.startIndex, length: range.count), string)
	}
}

extension NSString {
	var characters: [unichar] {
		var characters = [unichar]()

		for i in 0..<length {
			characters.append(character(at: i))
		}

		return characters
	}
}
