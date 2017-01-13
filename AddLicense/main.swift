#!/usr/bin/swift

import Foundation

let fileManager = FileManager.default
let parser = OptionParser()
let (extensionsToChange, prefix, licensePath, filePaths) = parser.parse(CommandLine.arguments)
let license = try! String(contentsOfFile: licensePath)
let rewriter = LicenseRewriter(license, prefix: prefix)

for dirPath in filePaths {
    let filenames = fileManager.enumerator(atPath: dirPath)?.filter { (e) -> Bool in
        let s = e as! String
        let url = URL(fileURLWithPath: s)
        return extensionsToChange.contains(url.pathExtension)
    }

    for fn in filenames! {
        let filePath = "\(dirPath)/\(fn)"
        let contents = try! String(contentsOfFile: filePath)
        let rewritten = rewriter.rewrite(contents)
        do {
            try rewritten.write(toFile: filePath, atomically: false, encoding: String.Encoding.utf8)
        }
        catch let e as NSError {
            print("Ignoring exception: \(e)")
        }
    }
}

exit(0)
