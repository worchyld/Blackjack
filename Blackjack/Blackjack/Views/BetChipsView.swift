//
//  BetChipsView.swift
//  Blackjack
//
//  Created by Amarjit on 09/09/2024.
//

import SwiftUI

enum Chips: Int {
    case five = 5
    case ten = 10
    case twenty = 20
    case fifty = 50
}

struct BetChipsView: View {
    let coins: Int
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    BetChipsView(coins: 10)
}
