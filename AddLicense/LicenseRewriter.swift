import Foundation

class LicenseRewriter {
    var license: String!
    var prefix: String!

    init(_ license: String, prefix: String) {
        self.license = license.trimmingCharacters(in: CharacterSet.newlines)
        self.prefix = prefix
    }

    func rewrite(_ source: String) -> String {
        let licenseRemoved = removeLicense(source)

        if startsWithComment(source) {
            return license + "\n" + licenseRemoved
        } else {
            return license + "\n\n" + licenseRemoved
        }
    }

    fileprivate func removeLicense(_ source: String) -> String {
        if startsWithComment(source) {
            let rangeOfFirstNewline = source.range(of: "\n")
            let afterNewline = source.characters.suffix(from: rangeOfFirstNewline!.upperBound)
            return removeLicense(String(afterNewline))
        } else {
            return source
        }
    }

    fileprivate func startsWithComment(_ source: String) -> Bool {
        let firstChar = source.startIndex
        let secondChar = source.characters.index(source.startIndex, offsetBy: 1)
        let firstTwoChars = source[firstChar...secondChar]
        let paddedPrefix = prefix.padding(toLength: 2, withPad: " ", startingAt: 0)
        return firstTwoChars == paddedPrefix || firstTwoChars == "\(prefix!)\n"
    }
}
