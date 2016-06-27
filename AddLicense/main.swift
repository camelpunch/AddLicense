#!/usr/bin/swift

import Foundation

let fileManager = NSFileManager.defaultManager()
let licenseAndFilePaths = Process.arguments.dropFirst()
let license = try! String(contentsOfFile: licenseAndFilePaths[licenseAndFilePaths.startIndex])
let rewriter = LicenseRewriter(license)
let filePaths = licenseAndFilePaths.dropFirst()

for dirPath in filePaths {
    let extensionsToChange = Set(["swift", "h", "m"])

    let filenames = fileManager.enumeratorAtPath(dirPath)?.filter { (e) -> Bool in
        let s = e as! String
        let url = NSURL(fileURLWithPath: s)
        return extensionsToChange.contains(url.pathExtension!)
    }

    for fn in filenames! {
        let filePath = "\(dirPath)/\(fn)"
        let contents = try! String(contentsOfFile: filePath)
        let rewritten = rewriter.rewrite(contents)
        do {
            try rewritten.writeToFile(filePath, atomically: false, encoding: NSUTF8StringEncoding)
        }
        catch let e as NSError {
            print("Ignoring exception: \(e)")
        }
    }

}
exit(0)