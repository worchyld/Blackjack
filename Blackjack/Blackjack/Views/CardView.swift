//
//  CardView.swift
//  Blackjack
//
//  Created by Amarjit on 04/03/2022.
//

import SwiftUI

struct CardView: View {
    let card = Card.init(rank: .queen, suit: .clubs)
    
    var body: some View {
        Image("clubs-10").resizable().frame(width: 85, height: 135, alignment: .center)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
