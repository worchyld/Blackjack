//
//  GameTableView.swift
//  Blackjack
//
//  Created by Amarjit on 02/05/2023.
//

import SwiftUI

struct GameTableView: View {
    @State private var deck: [MyCard] = MyCard.allCards.shuffled()
        @State private var playerCards: [MyCard] = []
        @State private var dealerCards: [MyCard] = []
        
        var body: some View {
            ZStack {
                // Pile of cards
                ForEach(deck.reversed()) { card in
                    MyCardView(card: card)
                        .zIndex(card.zIndex)
                        .offset(CGSize(width: 0, height: -CGFloat(card.zIndex)))
                }
                
                // Player cards
                ForEach(playerCards) { card in
                    MyCardView(card: card)
                        .zIndex(card.zIndex)
                        .offset(card.offset)
                        .rotationEffect(card.rotation)
                }
                
                // Dealer cards
                ForEach(dealerCards) { card in
                    MyCardView(card: card)
                        .zIndex(card.zIndex)
                        .offset(card.offset)
                        .rotationEffect(card.rotation)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green)
            .onTapGesture {
                dealCards()
            }
        }
        
        func dealCards() {
            if deck.count >= 2 {
                // Deal a card to the player
                var playerCard = deck.removeLast()
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    playerCard.offset = CGSize(width: -50, height: 100)
                    playerCard.rotation = Angle.degrees(-10)
                    playerCards.append(playerCard)
                }
                
                // Deal a card to the dealer
                var dealerCard = deck.removeLast()
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    dealerCard.offset = CGSize(width: 50, height: 100)
                    dealerCard.rotation = Angle.degrees(10)
                    dealerCards.append(dealerCard)
                }
            }
        }
}


struct MyCardView: View {
    let card: MyCard
    
    var body: some View {
        Image(card.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 70, height: 100)
    }
}

struct MyCard: Identifiable {
    let id: Int
    let rank: Card.Rank
    let suit: Card.Suit
    var imageName: String {
        return "\(rank.rawValue)_of_\(suit.rawValue)"
    }
    var zIndex: Double = 0
    var offset: CGSize = .zero
    var rotation: Angle = .zero
    
    static let allCards: [MyCard] = {
        var cards: [MyCard] = []
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                cards.append(MyCard(id: cards.count, rank: rank, suit: suit))
            }
        }
        return cards
    }()
}

struct GameTableView_Previews: PreviewProvider {
    static var previews: some View {
        GameTableView()
    }
}
