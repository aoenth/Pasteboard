# Pasteboard

Pasteboard is a Swift package for macOS applications that changes the copied content inside the Pasteboard based on a function. It only works with text-based content.

## Requirements
* Swift Package Manager with Swift version 5.3 or higher

## Usage

To get content from the pasteboard, use `getPasteboardContent()`. It returns a string if the pasteboard contains string.
To set the contents of the clipboard to a string, use `setPasteboardContent(_:)`.
If the pasteboard contains String, you also can modify the pasteboard content by passing in a function with the signature `(String) -> String` into the function `processPasteboard(modifier:)`.

### Examples

#### Passing in a Function
```swift
import Pasteboard

func trim(input: String) -> String {
    input.trimmingCharacters(in: .init(charactersIn: " "))
}

processPasteboard(modifier: trim)
```
#### Passing in a Closure
```swift
import Pasteboard

let trimClosure: (String) -> String = {
    $0.trimmingCharacters(in: .init(charactersIn: " "))
}

processPasteboard(modifier: trimClosure)
```

#### Passing in a Closure In-Line
```swift
import Pasteboard

processPasteboard {
    $0.trimmingCharacters(in: .init(charactersIn: " "))
}
```

#### Passing in a Keypath
```swift
import Pasteboard

processPasteboard(modifier: \.capitalized)
```

#### Get Pasteboard Content
```swift
import Pasteboard

let pasteboardContent = getPasteboardContent()
```

#### Set Pasteboard Content
```swift
import Pasteboard

let date = String(describing: Date())

setPasteboardContent(date)
```
