//
//  ContentView.swift
//  spaceapp
//
//  Created by Scholar on 6/27/23.
//brainspace :) - test 1
//HELLO efwiheofiuh - test 2
//test 3

import SwiftUI

struct ContentView: View {
    @State private var isPresentingTodolist = false
    var body: some View {
        ZStack {
            Color(red: 0.278, green: 0.339, blue: 0.342)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Image("image")
                    .imageScale(.large)
                Image("title")
                 .resizable()
                 .imageScale(.small)
                 .aspectRatio(contentMode: .fit)
                Button(action: {
                    isPresentingTodolist = true
                }) {
                    Text("to-do list")
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.738, green: 0.64, blue: 0.676))
                }
                .font(.title2)
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 0.362, green: 0.217, blue: 0.298))
                .sheet(isPresented: $isPresentingTodolist) {
                    todolist()
                }
                
                
            
            }//end of vstack
            .padding()
            
        }//end of zstack
    }//end of body
}//end of struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
