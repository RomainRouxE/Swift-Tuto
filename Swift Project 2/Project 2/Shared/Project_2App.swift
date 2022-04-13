//
//  Project_2App.swift
//  Shared
//
//  Created by Roux Romain on 27/03/2022.
//

import SwiftUI

@main
struct Project_2App: App {
    let document = EmojiArtDocument()
    let paletteStore = PaletteStore(named: "Default")
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
        }
    }
}
