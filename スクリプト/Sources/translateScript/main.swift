import Foundation

print("currentDirectoryPath:", FileManager.default.currentDirectoryPath)

print("CommandLine.arguments[1]: ", CommandLine.arguments[1])

let ⓕolderName = CommandLine.arguments[1]

let ⓣemporaryHtmlBody = 🄵ile.load(ⓕolderName + "/temporaryBody.html")!
let ⓓescription = 🄵ile.load(ⓕolderName + "/description.txt")!

let ⓗtml = 🄷TML(folderName: ⓕolderName,
                 title: ⓕolderName,
                 description: ⓓescription,
                 body: ⓣemporaryHtmlBody)

for ⓛang in 🗺️Language.allCases {
    let ⓡesult = try await ⓗtml.translate(ⓛang)
    🄵ile.save(ⓡesult, ⓕolderName + "/\(ⓛang.htmlTag).html")
    //let ⓡeverseTraslation = try await 🅃ranslate(ⓡesult, in: .日本語)
    //Save(ⓡeverseTraslation, ⓕolderName + "/\(ⓛang.htmlTag)_ja.html")
}
