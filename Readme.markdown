# Diff

Simple diffing library in pure Swift.


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
// range: 6...6
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
// range: 3...3
// replacement: [4]
```

You can even use arrays of anything as long as you can compare them:

```swift
let before: [Foo] = [a, b]
let after: [Foo] = [b]
let (range, replacement) = diff(before, after, compare: Foo.compare)!
// range: 0...0
// replacement: []
```
