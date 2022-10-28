//
//  TableView.swift
//  Blackjack
//
//  Created by Amarjit on 22/04/2022.
//

import SwiftUI

struct TableView: View {
    var body: some View {
        //50,182,122
        Color(hex: "#32B67A")
            .ignoresSafeArea(.all) // Ignore just for the color
               .overlay(
                   VStack(spacing: 20) {
                       //Text("Overlay").font(.largeTitle)
                       //Text("Example").font(.title).foregroundColor(.white)
                       HStack(alignment: .center, spacing: 20) {
                           Text("Score: 0")
                           Button {
                           } label: {
                               Text("Menu").font(.largeTitle).foregroundColor(.white)
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
               })
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
