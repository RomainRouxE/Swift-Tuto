//
//  EmojiMemoryGame.swift
//  Project1
//
//  Created by Roux Romain on 20/03/2022.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject{
    typealias Card = MemoryGame<String>.Card
    private static var emojis = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 9) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
