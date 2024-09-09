//
//  BJTableView.swift
//  Blackjack
//
//  Created by Amarjit on 06/09/2024.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        VStack {
            HeaderView().padding(.top, 50)
            Spacer()
            Text("GameTable")
            Spacer()
            FooterView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
    }

}

struct HeaderView: View {
    let score: Int = 0
    var body: some View {
        Text("Score: \(score)")
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
