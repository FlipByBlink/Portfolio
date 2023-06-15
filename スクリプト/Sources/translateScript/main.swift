import Foundation

print("currentDirectoryPath:", FileManager.default.currentDirectoryPath)

print("CommandLine.arguments[1]: ", CommandLine.arguments[1])

let ⓕolderName = CommandLine.arguments[1]

let ⓣemporaryHtmlBody = 🄻oad(ⓕolderName + "/temporaryBody.html")!
let ⓓescription = 🄻oad(ⓕolderName + "/description.txt")!

let ⓗtmlModel = 🄷TMLModel(folderName: ⓕolderName,
                           title: ⓕolderName,
                           description: ⓓescription,
                           originalBody: ⓣemporaryHtmlBody)
try await ⓗtmlModel.translate()
🅂ave(ⓗtmlModel.result, ⓕolderName + "/index.html")
