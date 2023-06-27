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
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .foregroundColor(Color.indigo)
                .imageScale(.large)
                
            Text("BrainSpace")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
