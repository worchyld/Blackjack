//
//  BJTableView.swift
//  Blackjack
//
//  Created by Amarjit on 06/09/2024.
//

import SwiftUI

class PlayViewModel: ObservableObject {
    @Published var deck: Deck
    @Published var player: Player
    
    init() {
        self.deck = Deck()
        self.player = Player(name: "Player", initialCoins: 20)
        self.prepareDeck()
    }
    
    private func prepareDeck() {
        deck.prepare()
        print("Deck initialized - \(deck.cards.count) cards")
        for card in deck.cards {
            print(card)
        }
    }
}

struct PlayView: View {
    @StateObject private var viewModel = PlayViewModel()
    
    var body: some View {
        VStack {
            HeaderView(score: viewModel.player.calculateScore(), coins: viewModel.player.coins)
            Spacer()
            Text("GameTable")
            Spacer()
            FooterView().padding(.bottom, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        /*
        .background(
            Image("table")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.height) // Increase size by 50%
                .clipped()
        )*/
        .edgesIgnoringSafeArea(.all) // This ensures the background extends to the edges of the screen
        .onAppear {
            // The deck is already prepared in the ViewModel's init,
            // so we don't need to do anything here.
        }
    }
}

struct HeaderView: View {
    let score: Int
    let coins: Int

    var body: some View {
        HStack {
            AvatarView(avt: .avatar1, width: 80)
            
            VStack(alignment: .leading) {
                Text("Score: \(score)")
                    .font(.subheadline)
                Text("Coins: \(coins)")
                    .font(.subheadline)
            }

            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.2))
        .padding(.horizontal)
    }
}


struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 5)
                )
        }
    }
}

struct DealerAreaView: View {
    var body: some View {
        Text("Dealer area")
    }
}

struct PlayerAreaView: View {
    var body: some View {
        Text("Player area")
    }
}

struct FooterView: View {
    var body: some View {
        HStack(spacing: 30, content: {
            ButtonView(title: "Hit") {
                print("Hit button tapped")
            }
            ButtonView(title: "Stand") {
                print("Stand button tapped")
            }
        }).padding(.bottom)
    }
}

#Preview {
    PlayView()
}
