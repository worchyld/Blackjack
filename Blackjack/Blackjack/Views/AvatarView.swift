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
    let avt: Avatars
    let width: CGFloat
    let height: CGFloat
    //let size: CGFloat
    let constrainProportions: Bool
    
    init(avt: Avatars, width: CGFloat = 100, height: CGFloat = 100, constrainProportions: Bool = true) {
    //init(avt: Avatars, size: CGFloat = 50, constrainProportions: Bool = true) {
       self.avt = avt
       //self.size = size
        self.width = width
        self.height = height
       self.constrainProportions = constrainProportions
    }
    
    var body: some View {
        VStack {
            Image(avt.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: constrainProportions ? width : height)
                .clipShape(Circle())
        }
    }
}

#Preview {
    AvatarView(avt: .avatar1)
}
