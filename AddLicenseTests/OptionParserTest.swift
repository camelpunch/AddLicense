import XCTest

class OptionParserTest: XCTestCase {

    func testSeparatesExtensionsAndLicenseAndOtherFilenames() {
        let parser = OptionParser()
        let (extensions, license, filenames) = parser.parse(["execname", "erb,rb,bat,txt", "my-license.txt", "my-dir", "my-other-dir"])
        XCTAssertEqual(Set(["erb", "rb", "bat", "txt"]), extensions)
        XCTAssertEqual("my-license.txt", license)
        XCTAssertEqual(["my-dir", "my-other-dir"], filenames)
    }

}
