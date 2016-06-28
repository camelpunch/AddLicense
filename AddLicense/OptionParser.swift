import Foundation

class OptionParser {

    func parse(args: [String]) -> (String, [String]) {
        let licenseAndFilePaths = args.dropFirst()
        let license = licenseAndFilePaths.first!
        let filePaths = Array(licenseAndFilePaths.dropFirst())
        return (license, filePaths)
    }

}