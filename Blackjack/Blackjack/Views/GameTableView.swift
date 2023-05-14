//
//  GameTableView.swift
//  Blackjack
//
//  Created by Amarjit on 02/05/2023.
//

import SwiftUI

struct GameTableView: View {        
    var body: some View {
        ZStack {
            Text("Hello world")
                .font(.body)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
    }
}


struct GameTableView_Previews: PreviewProvider {
    static var previews: some View {
        GameTableView()
    }
}
