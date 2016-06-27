import XCTest

class AddLicenseTests: XCTestCase {

    func testAddsLicenseToStringWithoutLicense() {
        let source    = "Some source code\n" +
                        "Here it is"
        let license   = "// Silly license 4.2\n" +
                        "// Please add me"
        let rewriter  = LicenseRewriter(license)
        let rewritten = rewriter.rewrite(source)
        let expected  = "// Silly license 4.2\n" +
                        "// Please add me\n" +
                        "\n" +
                        "Some source code\n" +
                        "Here it is"

        XCTAssertEqual(expected, rewritten)
    }

    func testReplacesExistingLicenseWithNew() {
        let source    = "// Older license 1.2.3\n" +
                        "// All rights reserved\n" +
                        "\n" +
                        "// Just a comment\n" +
                        "\n" +
                        "Some source code\n"
        let license   = "// Replacement license 4.2\n" +
                        "// Please use me"
        let rewriter  = LicenseRewriter(license)
        let rewritten = rewriter.rewrite(source)
        let expected  = "// Replacement license 4.2\n" +
                        "// Please use me\n" +
                        "\n" +
                        "// Just a comment\n" +
                        "\n" +
                        "Some source code\n"

        XCTAssertEqual(expected, rewritten)
    }

}
