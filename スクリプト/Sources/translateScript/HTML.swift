import Foundation

struct 🄷TML {
    var folderName: String
    var title: String
    var description: String
    var body: String
    
    func translate(_ ⓛang: 🗺️Language) async throws -> String {
        let ⓑody: String
        let ⓓescription: String
        if let ⓒache = 🄵ile.load(self.bodyCacheFileName(ⓛang)) {
            ⓑody = ⓒache
        } else {
            ⓑody = try await 🅃ranslation.translate(self.body, in: ⓛang)
            🄵ile.save(ⓑody, self.bodyCacheFileName(ⓛang))
        }
        if let ⓒache = 🄵ile.load(self.descriptionCacheFileName(ⓛang)) {
            ⓓescription = ⓒache
        } else {
            ⓓescription = try await 🅃ranslation.translate(self.description, in: ⓛang)
            🄵ile.save(ⓓescription, self.descriptionCacheFileName(ⓛang))
        }
        return self.assembleHTML(ⓛang, ⓑody, ⓓescription)
    }
}

extension 🄷TML {
    private static let domain: String = "flipbyblink.github.io/Portfolio"
    
    private func assembleHTML(_ ⓛang: 🗺️Language, _ ⓑody: String, _ ⓓescription: String) -> String {
        """
        <!DOCTYPE html>
        <html>
        
        <head>
        <meta charset="utf-8">
        <link rel="alternate" hreflang="ja" href="https://\(Self.domain)/\(self.folderName)/ja.html"/>
        <link rel="alternate" hreflang="en" href="https://\(Self.domain)/\(self.folderName)/en.html"/>
        <link rel="alternate" hreflang="id" href="https://\(Self.domain)/\(self.folderName)/id.html"/>
        <link rel="alternate" hreflang="es" href="https://\(Self.domain)/\(self.folderName)/es.html"/>
        <link rel="alternate" hreflang="de" href="https://\(Self.domain)/\(self.folderName)/de.html"/>
        <link rel="alternate" hreflang="fr" href="https://\(Self.domain)/\(self.folderName)/fr.html"/>
        <link rel="alternate" hreflang="pt" href="https://\(Self.domain)/\(self.folderName)/pt.html"/>
        <link rel="alternate" hreflang="ru" href="https://\(Self.domain)/\(self.folderName)/ru.html"/>
        <link rel="alternate" hreflang="zh" href="https://\(Self.domain)/\(self.folderName)/zh.html"/>
        <link rel="alternate" hreflang="uk" href="https://\(Self.domain)/\(self.folderName)/uk.html"/>
        <link rel="alternate" hreflang="ko" href="https://\(Self.domain)/\(self.folderName)/ko.html"/>
        <link rel="alternate" hreflang="x-default" href="https://\(Self.domain)/\(self.folderName)/en.html"/>
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
    
    private func bodyCacheFileName(_ ⓛang: 🗺️Language) -> String {
        self.folderName + "/_cache/body_translated_in_\(ⓛang.htmlTag).txt"
    }
    
    private func descriptionCacheFileName(_ ⓛang: 🗺️Language) -> String {
        self.folderName + "/_cache/description_translated_in_\(ⓛang.htmlTag).txt"
    }
}
