import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isChecked: Bool = false
    var isDeleted: Bool = false
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

            List {
                ForEach(todoItems) { item in
                    if !item.isDeleted {
                        HStack {
                            Button(action: {
                                toggleItem(item)
                            }) {
                                Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                            }
                            Text(item.title)
                                .strikethrough(item.isChecked)
                            Spacer()
                            Button(action: {
                                deleteItem(item)
                            }) {
                                Image(systemName: "trash")
                            }
                        }
                    }
                }
            }
        }
    }

    private func toggleItem(_ item: TodoItem) {
        if let index = todoItems.firstIndex(where: { $0.id == item.id }) {
            todoItems[index].isChecked.toggle()
        }
    }

    private func deleteItem(_ item: TodoItem) {
        if let index = todoItems.firstIndex(where: { $0.id == item.id }) {
            todoItems[index].isDeleted = true
        }
    }
}

struct todolist_Previews: PreviewProvider {
    static var previews: some View {
        todolist()
    }
}

