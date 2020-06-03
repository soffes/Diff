# Diff

[![Version](https://img.shields.io/github/release/soffes/Diff.svg)](https://github.com/soffes/Diff/releases)
[![Build Status](https://github.com/soffes/Color/workflows/Tests/badge.svg)](https://github.com/soffes/Color/actions)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Simple diffing library in pure Swift.

## Installing

You can use [Carthage](https://github.com/Carthage/Carthage) or [Swift Package Manager](https://github.com/apple/swift-package-manager) to install Diff.


## Usage

Start by importing the package:

```swift
import Diff
```

### Same

If there is no difference, the diff will be `nil`.

``` swift
diff("Hello", "Hello") // nil
```

For the sake of brevity, we'll `!` the rest of the examples since we know they're different.


### Insert

``` swift
let (range, string) = diff("Hello world", "Hello there world")!
// range: 6..<6
// string: "there "
```


### Remove

``` swift
let (range, string) = diff("Hello there world", "Hello world")!
// range: 6..<12
// string: ""
```


### Other Types

Diff can diff any array. Here's an array of things that conform to `Equatable`:

``` swift
let (range, replacement) = diff([1, 2, 3], [1, 2, 3, 4])!
// range: 3..<3
// replacement: [4]
```

You can even use arrays of anything as long as you can compare them:

```swift
let before: [Foo] = [a, b]
let after: [Foo] = [b]
let (range, replacement) = diff(before, after, compare: Foo.compare)!
// range: 0..<1
// replacement: []
```

## Development

If you want to contribute to Diff, please write a test.

Building and running the tests locally with SPM is easy:

    $ git clone https://github.com/soffes/Diff
    $ cd Diff
    $ swift build
    $ swift test


## Thanks

Thanks to [Jonathan Clem](https://github.com/jclem) for the original algorithm and [Caleb Davenport](https://github.com/calebd) for inspiration for the generics implementation and help debugging a few edge cases!
