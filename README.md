# Pasteboard

Pasteboard is a library that changes the Pasteboard on macOS based on a function. It only works with text-based content.

## Requirements
* Swift Package Manager with Swift version 5.3 or higher

## Usage

The public function that this library provides is `processPasteboard(modifier:)`. It accepts a throwing closure that accepts a String and returns a String. You can pass in a function, a closure, or a keypath that modifies a String.

### Passing in a Function
```swift
func trim(input: String) -> String {
    input.trimmingCharacters(in: .init(charactersIn: "."))
}

processPasteboard(modifier: trim)
```
### Passing in a Closure
```swift
let trimClosure: (String) -> String = {
    $0.trimmingCharacters(in: .init(charactersIn: "."))
}

processPasteboard(modifier: trimClosure)
```

### Passing in a Closure In-Line
```swift
processPasteboard {
    $0.trimmingCharacters(in: .init(charactersIn: " "))
}
```

### Passing in a keypath
```swift
processPasteboard(modifier: \.capitalized)
```

