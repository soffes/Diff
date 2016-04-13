protocol Foo {
	var value: Int { get }
}


func compareFoo(lhs: Foo, rhs: Foo) -> Bool {
	return lhs.value == rhs.value
}


struct Bar: Foo {
	let value: Int

	init(value: Int) {
		self.value = value
	}
}
