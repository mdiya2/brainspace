//
//  timer.swift
//  spaceapp
//
//  Created by Scholar on 6/27/23.
//

import SwiftUI

struct timer: View {
    @State private var isPresentingGame = false
    var body: some View {
        VStack{
            Text("i am timer")
            
            Button(action: {
                isPresentingGame = true
            }) {
                Text("game")
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.738, green: 0.64, blue: 0.676))
            }
            .font(.title2)
            .buttonStyle(.borderedProminent)
            .tint(Color(red: 0.362, green: 0.217, blue: 0.298))
            .sheet(isPresented: $isPresentingGame) {
                game()
            }
        }
    }
}

struct timer_Previews: PreviewProvider {
    static var previews: some View {
        timer()
    }
}
