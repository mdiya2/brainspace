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
        ZStack {
            VStack {
                Image("image")
                    .imageScale(.large)
                Text("BrainSpace")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.738, green: 0.64, blue: 0.676))
                    .multilineTextAlignment(.leading)
            }//end of vstack
            .padding()
            .background(Color(red: 0.278, green: 0.339, blue: 0.342))
        }//end of zstack
    }//end of body
}//end of struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
