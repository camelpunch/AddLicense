#!/usr/bin/swift

import Foundation

let fileManager = NSFileManager.defaultManager()
let parser = OptionParser()
let (extensionsToChange, prefix, licensePath, filePaths) = parser.parse(Process.arguments)
let license = try! String(contentsOfFile: licensePath)
let rewriter = LicenseRewriter(license, prefix: prefix)

for dirPath in filePaths {
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