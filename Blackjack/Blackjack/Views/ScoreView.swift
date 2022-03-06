//
//  ScoreView.swift
//  Blackjack
//
//  Created by Amarjit on 06/03/2022.
//

import SwiftUI

struct ScoreView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Score: 0").multilineTextAlignment(.trailing).padding(.trailing, 25.0)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
