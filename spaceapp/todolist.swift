//
//  todolist.swift
//  spaceapp
//
//  Created by Scholar on 6/29/23.
//

import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
}

struct todolist: View {
    @State private var todoItems: [TodoItem] = []
    @State private var newItemTitle = ""

    var body: some View {
        VStack {
            HStack {
                TextField("Add a new item", text: $newItemTitle)
                Button(action: {
                    guard !newItemTitle.isEmpty else { return }
                    let newItem = TodoItem(title: newItemTitle)
                    todoItems.append(newItem)
                    newItemTitle = ""
                }) {
                    Text("Add")
                }
            }.padding()

            List(todoItems) { item in
                Text(item.title)
            }
        }
    }
}

struct todolist_Previews: PreviewProvider {
    static var previews: some View {
        todolist()
    }
}
