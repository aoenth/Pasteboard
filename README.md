# Pasteboard

Changes system-wide Pasteboard based on a function.



## Usage

The public function that this library provides is `processPasteboard(modifier:)`. It accepts a throwing closure that accepts a String and returns a String. You can pass in a function, a closure, or a keypath that modifies a `String`

```swift
func trim(input: String) -> String {
    input.trimmingCharacters(in: .init(charactersIn: "."))
}

let trimClosure: (String) -> String = {
    $0.trimmingCharacters(in: .init(charactersIn: "."))
}

processPasteboard(modifier: trim)
processPasteboard(modifier: trimClosure)
processPasteboard(modifier: \.capitalized)

processPasteboard {
    $0.trimmingCharacters(in: .init(charactersIn: " "))
}

```
