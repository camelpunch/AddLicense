import XCTest

class OptionParserTest: XCTestCase {

    func testSeparatesLicenseAndOtherFilenames() {
        let parser = OptionParser()
        let (license, filenames) = parser.parse(["execname", "my-license.txt", "my-dir", "my-other-dir"])
        XCTAssertEqual("my-license.txt", license)
        XCTAssertEqual(["my-dir", "my-other-dir"], filenames)
    }

}
