//
//  Project1App.swift
//  Shared
//
//  Created by Roux Romain on 20/03/2022.
//

import SwiftUI

@main
struct Project1App: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
