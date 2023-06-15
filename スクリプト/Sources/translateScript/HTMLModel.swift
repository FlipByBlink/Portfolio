import Foundation

struct 🄷TMLModel {
    var folderName: String
    var title: String
    var description: String
    var originalBody: String
    
    func translate() async throws {
        for ⓛang in 🗺️Language.allCases {
            if ⓛang == .日本語 { continue }
            if 🄻oad(self.bodyCacheFileName(ⓛang)) == nil {
                🅂ave(try await 🅃ranslate(self.originalBody, in: ⓛang),
                      self.bodyCacheFileName(ⓛang))
            }
            if 🄻oad(self.descriptionCacheFileName(ⓛang)) == nil {
                🅂ave(try await 🅃ranslate(self.description, in: ⓛang),
                      self.descriptionCacheFileName(ⓛang))
            }
        }
    }
    
    var result: String {
        """
        <!DOCTYPE html>
        <html>
        
        <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>\(self.title)</title>
        <meta name="description" content="\(ⓓescription)">
        <meta name="robots" content="index, follow">
        <style>
        body {
            font-family: sans-serif;
            max-width: 600px;
            margin: auto;
            padding: 16px;
        }
        
        img {
            max-width: 100%;
        }
        
        blockquote {
            padding: 8px;
            background-color: #80808020;
            border-radius: 4px;
        }
        
        q {
            padding: 6px;
            background-color: #80808020;
            border-radius: 4px;
        }
        
        pre {
            overflow-x: auto;
            border: 1px solid gray;
            padding: 12px;
            border-radius: 6px;
        }
        
        table {
            border-collapse: collapse;
        }
        
        td,
        th {
            border: 1px solid gray;
            padding: 8px;
        }
        
        @media (prefers-color-scheme: dark) {
            :root {
                --primaryColor: white;
                --backgroundColor: #212121;
                --primaryAccentColor: DeepSkyBlue;
                --secondaryAccentColor: DarkCyan;
            }
        
            body {
                color: var(--primaryColor);
                background-color: var(--backgroundColor);
            }
        
            a:link {
                color: var(--primaryAccentColor);
            }
        
            a:visited {
                color: var(--secondaryAccentColor);
            }
        }
        </style>
        </head>
        <body>
        \(self.wholeBody)
        </body>
        </html>
        """
    }
}

extension 🄷TMLModel {
    private var wholeBody: String {
        var ⓥalue = ""
        ⓥalue += self.originalBody
        ⓥalue += 🗺️Language.allCases.reduce(into: "") { ⓟartialResult, ⓛang in
            if ⓛang == .日本語 { return }
            ⓟartialResult += "\n<hr>\n"
            ⓟartialResult += "<p id=\"\(ⓛang.rawValue)\" style=\"text-align: center\">\(ⓛang.representationText)</p>"
            ⓟartialResult += 🄻oad(self.bodyCacheFileName(ⓛang))!
        }
        return ⓥalue
    }
    
    private func bodyCacheFileName(_ ⓛang: 🗺️Language) -> String {
        self.folderName + "/_cache/body_translated_in_\(ⓛang.htmlTag).txt"
    }
    
    private func descriptionCacheFileName(_ ⓛang: 🗺️Language) -> String {
        self.folderName + "/_cache/description_translated_in_\(ⓛang.htmlTag).txt"
    }
}
