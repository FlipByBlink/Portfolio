import Foundation

struct 🄷TMLTemplate {
    var folderName: String
    var title: String
    var description: String
    var body: String
    
    func translate(_ ⓛang: 🗺️Language) async throws -> String {
        let ⓑody: String
        let ⓓescription: String
        if let ⓒache = 🄻oad(self.bodyCacheFileName(ⓛang)) {
            ⓑody = ⓒache
        } else {
            ⓑody = try await 🅃ranslate(self.body, in: ⓛang)
            🅂ave(ⓑody, self.bodyCacheFileName(ⓛang))
        }
        if let ⓒache = 🄻oad(self.descriptionCacheFileName(ⓛang)) {
            ⓓescription = ⓒache
        } else {
            ⓓescription = try await 🅃ranslate(self.description, in: ⓛang)
            🅂ave(ⓓescription, self.descriptionCacheFileName(ⓛang))
        }
        return self.assembleHTML(ⓛang, ⓑody, ⓓescription)
    }
    
    func assembleHTML(_ ⓛang: 🗺️Language, _ ⓑody: String, _ ⓓescription: String) -> String {
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
        \(ⓑody)
        </body>
        </html>
        """
    }
    
    func bodyCacheFileName(_ ⓛang: 🗺️Language) -> String {
        self.folderName + "/_cache/body_translated_in_\(ⓛang.htmlTag).txt"
    }
    
    func descriptionCacheFileName(_ ⓛang: 🗺️Language) -> String {
        self.folderName + "/_cache/description_translated_in_\(ⓛang.htmlTag).txt"
    }
}
