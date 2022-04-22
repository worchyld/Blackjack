//
//  TableView.swift
//  Blackjack
//
//  Created by Amarjit on 22/04/2022.
//

import SwiftUI

struct TableView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 20) {
                Text("Score: 0")
                Button {
                } label: {
                    Text("Menu")
                }
            }
        
            HStack(alignment: .center, spacing: 20) {
                Button {
                } label: {
                    Text("Hit")
                }
                Button {
                } label: {
                    Text("Stand")
                }
            }
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
