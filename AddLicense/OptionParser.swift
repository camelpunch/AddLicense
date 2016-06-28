import Foundation

class OptionParser {

    func parse(args: [String]) -> (Set<String>, String, [String]) {
        let argsWithoutExec = args.dropFirst()
        let rawExtensions = argsWithoutExec.first!
        let extensions = Set(rawExtensions.componentsSeparatedByString(","))
        let licenseAndFilePaths = argsWithoutExec.dropFirst()
        let license = licenseAndFilePaths.first!
        let filePaths = Array(licenseAndFilePaths.dropFirst())
        return (extensions, license, filePaths)
    }

}