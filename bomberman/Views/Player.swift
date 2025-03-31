//
//  Player.swift
//  bomberman
//
//  Created by Jayakrishnan M on 31/03/25.
//

import SwiftUI

struct Player: View {
    var body: some View {
        Circle()
            .fill(Color.red)
            .frame(width: 28, height: 28)
        
    }
}

#Preview {
    Player()
}
