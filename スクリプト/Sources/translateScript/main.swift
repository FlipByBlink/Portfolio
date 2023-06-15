import Foundation

print("currentDirectoryPath:", FileManager.default.currentDirectoryPath)

print("CommandLine.arguments[1]: ", CommandLine.arguments[1])

let ⓕolderName = CommandLine.arguments[1]

let ⓣemporaryHtmlBody = 🄻oad(ⓕolderName + "/temporaryBody.html")!
let ⓓescription = 🄻oad(ⓕolderName + "/description.txt")!

let ⓗtmlModel = 🄷TMLTemplate(folderName: ⓕolderName,
                              title: ⓕolderName,
                              description: ⓓescription,
                              body: ⓣemporaryHtmlBody)

for ⓛang in 🗺️Language.allCases {
    if ⓛang == .日本語 { continue }
    let ⓡesult = try await ⓗtmlModel.translate(ⓛang)
    🅂ave(ⓡesult, ⓕolderName + "/\(ⓛang.htmlTag).html")
    //let ⓡeverseTraslation = try await 🅃ranslate(ⓡesult, in: .日本語)
    //Save(ⓡeverseTraslation, ⓕolderName + "/\(ⓛang.htmlTag)_ja.html")
}
