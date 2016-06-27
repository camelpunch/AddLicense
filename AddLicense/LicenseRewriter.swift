import Foundation

class LicenseRewriter {
    var license: String!

    init(_ license: String) {
        self.license = license.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    }

    func rewrite(source: String) -> String {
        let licenseRemoved = removeLicense(source)

        if startsWithComment(source) {
            return license + "\n" + licenseRemoved
        } else {
            return license + "\n\n" + licenseRemoved
        }
    }

    private func removeLicense(source: String) -> String {
        if startsWithComment(source) {
            let rangeOfFirstNewline = source.rangeOfString("\n")
            let afterNewline = source.characters.suffixFrom(rangeOfFirstNewline!.endIndex)
            return removeLicense(String(afterNewline))
        } else {
            return source
        }
    }

    private func startsWithComment(source: String) -> Bool {
        let firstChar = source.startIndex
        let secondChar = source.startIndex.advancedBy(1)
        let firstTwoChars = source[Range(firstChar...secondChar)]
        return firstTwoChars == "//"
    }
}