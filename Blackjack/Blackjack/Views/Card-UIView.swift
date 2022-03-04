//
//  Card-UIView.swift
//  Blackjack
//
//  Created by Amarjit on 04/03/2022.
//

import SwiftUI

struct Card_UIView: View {
    let card = Card.init(rank: .queen, suit: .clubs)
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8.0).foregroundColor(.white).shadow(color: .gray, radius: 5.0, x: 5.0, y: 5.0)
                
                VStack {
                    Text("\(String(card.suit.rawValue))")
                
                    Text("\(card.rank.stringValue.uppercased())")
                }
            }
        }.frame(width: 85, height: 135, alignment: .center)
    }
}

struct Card_UIView_Previews: PreviewProvider {
    static var previews: some View {
        Card_UIView()
    }
}
