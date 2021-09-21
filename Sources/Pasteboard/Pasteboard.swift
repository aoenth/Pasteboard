import AppKit

public func processPasteboard(
    modifier: (String) throws -> String
) rethrows {
    let pasteboard = NSPasteboard.general
    let typeToCheck = NSPasteboard.PasteboardType.string
    let string = getPasteboardContent()
    let newString = try modifier(string)
    pasteboard.clearContents()
    pasteboard.setString(newString, forType: typeToCheck)
}

public func getPasteboardContent() -> String {
    let pasteboard = NSPasteboard.general
    if let items = pasteboard.pasteboardItems {
        let typeToCheck = NSPasteboard.PasteboardType.string

        for element in items {
            if let string = element.string(forType: typeToCheck) {
                return string
            } else {
                print("Pasteboard doesn't contain string")
            }
        }
    } else {
        print("Pasteboard is empty!")
    }
    return ""
}
