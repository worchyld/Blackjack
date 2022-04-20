//
//  ScoreView.swift
//  Blackjack
//
//  Created by Amarjit on 06/03/2022.
//

import SwiftUI

struct ScoreView: View {
    @State var score: Double = 0
    
    var body: some View {
        HStack() {
            Color.clear
                .animatingOverlay(for: score)
                .font(.largeTitle)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 100)
    }
}
