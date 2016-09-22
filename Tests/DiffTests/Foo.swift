//
//  Foo.swift
//  Diff
//
//  Created by Sam Soffes on 4/12/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

protocol Foo {
	var value: Int { get }
}


func compareFoo(_ lhs: Foo, rhs: Foo) -> Bool {
	return lhs.value == rhs.value
}


struct Bar: Foo {
	let value: Int

	init(value: Int) {
		self.value = value
	}
}
