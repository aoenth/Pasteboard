import AppKit

public func processPasteboard(
    modifier: (String) throws -> String
) rethrows {
    let pasteboard = NSPasteboard.general
    if let items = pasteboard.pasteboardItems {
        let typeToCheck = NSPasteboard.PasteboardType.string

        for element in items {
            if let string = element.string(forType: typeToCheck) {
                let newString = try modifier(string)
                pasteboard.clearContents()
                pasteboard.setString(newString, forType: typeToCheck)
                return
            } else {
                print("Pasteboard doesn't contain string")
            }
        }
    } else {
        print("Pasteboard is empty!")
    }
}



func trim(input: String) -> String {
let removePeriodClosure: (String) -> String = {
    $0.trimmingCharacters(in: .init(charactersIn: " "))
}
    processPasteboard(modifier: \.capitalized)
    processPasteboard(modifier: removePeriodClosure)
    return ""
}
