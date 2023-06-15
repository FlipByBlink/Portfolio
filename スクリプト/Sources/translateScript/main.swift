import Foundation

print("currentDirectoryPath:", FileManager.default.currentDirectoryPath)

print("CommandLine.arguments[1]: ", CommandLine.arguments[1])

let ⓕolderName = CommandLine.arguments[1]

let ⓣemporaryHtmlBody = 🄵ile.load(ⓕolderName + "/temporaryBody.html")!
let ⓓescription = 🄵ile.load(ⓕolderName + "/description.txt")!

let ⓗtml = 🄷TML(folderName: ⓕolderName,
                 title: ⓕolderName,
                 description: ⓓescription,
                 originalBody: ⓣemporaryHtmlBody)
try await ⓗtml.translate()
🄵ile.save(ⓗtml.result, ⓕolderName + "/index.html")
