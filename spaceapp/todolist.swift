//
//  todo-list.swift
//  spaceapp
//
//  Created by Scholar on 6/27/23.
//

import SwiftUI

struct todolist: View {
    var body: some View {
        
        
        ZStack {
            Color(red: 0.278, green: 0.339, blue: 0.342)
                .edgesIgnoringSafeArea(.all)
            Text("Todo List")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.737, green: 0.64, blue: 0.676))
                .multilineTextAlignment(.leading)
        }
    }
    
    struct todo_list_Previews: PreviewProvider {
        static var previews: some View {
            todolist()
        }
    }
}
