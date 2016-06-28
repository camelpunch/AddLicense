import Foundation

class OptionParser {

    func parse(args: [String]) -> (Set<String>, String, String, [String]) {
        let extensions = Set(args[1].componentsSeparatedByString(","))
        let prefix = args[2]
        let license = args[3]
        let filePaths = Array(args.dropFirst(4))
        return (extensions, prefix, license, filePaths)
    }

}