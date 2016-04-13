struct Foo {
	let value: Int

	static func compare(lhs: Foo, rhs: Foo) -> Bool {
		return lhs.value == rhs.value
	}

	init(value: Int) {
		self.value = value
	}
}
