//
//  AvatarView.swift
//  Blackjack
//
//  Created by Amarjit on 20/04/2022.
//

import SwiftUI

enum Avatars : String {
    case avatar1 = "avatar-1"
    case avatar2 = "avatar-2"
    case avatar3 = "avatar-3"
    case avatar4 = "avatar-4"
    case avatar5 = "avatar-5"
    case avatar6 = "avatar-6"
    case avatar7 = "avatar-7"
    case avatar8 = "avatar-8"
    case avatar9 = "avatar-9"
}

struct AvatarView: View {
    @State var avatar : String = "avatar-1"
    
    var body: some View {
        VStack {
            Image(avatar)
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(avatar: Avatars.avatar1.rawValue)
    }
}
