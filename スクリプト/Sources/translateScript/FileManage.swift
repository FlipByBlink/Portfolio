import Foundation

func 🄻oad(_ ⓝame: String) -> String? {
    let ⓟath = FileManager.default.currentDirectoryPath + "/" + ⓝame
    return try? String(contentsOfFile: ⓟath, encoding: .utf8)
}

func 🅂ave(_ ⓣext: String, _ ⓝame: String) {
    let ⓟath = FileManager.default.currentDirectoryPath + "/" + ⓝame
    let ⓓata = ⓣext.data(using: .utf8)!
    if FileManager.default.createFile(atPath: ⓟath, contents: ⓓata) {
        print("🖨️ saved: \(ⓝame)")
    } else {
        print("🚨 failed to save: \(ⓝame)")
    }
}
