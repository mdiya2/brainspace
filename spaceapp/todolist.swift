//
//  todo-list.swift
//  spaceapp
//
//  Created by Scholar on 6/27/23.
//

import SwiftUI

struct todolist: View {
    @State private var isPresentingHome = false
    var body: some View {
        
        
        ZStack {
            Color(red: 0.278, green: 0.339, blue: 0.342)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Todo List")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.737, green: 0.64, blue: 0.676))
                    .multilineTextAlignment(.leading)
                Button(action: {
                    isPresentingHome = true
                }) {
                    Text("home")
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.738, green: 0.64, blue: 0.676))
                }
                .font(.title2)
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 0.362, green: 0.217, blue: 0.298))
                .sheet(isPresented: $isPresentingHome) {
                    ContentView()
                }
            }
        }
    }
    
    struct todo_list_Previews: PreviewProvider {
        static var previews: some View {
            todolist()
        }
    }
}
