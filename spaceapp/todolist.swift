import SwiftUI
struct TodoItem: Identifiable {
  let id = UUID()
  var title: String
  var isCompleted: Bool = false
}
class TodoListViewModel: ObservableObject {
  @Published var todoItems: [TodoItem] = []
  func addTodoItem(title: String) {
    let newItem = TodoItem(title: title)
    todoItems.append(newItem)
  }
  func deleteTodoItem(indexSet: IndexSet) {
    todoItems.remove(atOffsets: indexSet)
  }
  func toggleTodoItemCompletion(todoItem: TodoItem) {
    if let index = todoItems.firstIndex(where: { $0.id == todoItem.id }) {
      todoItems[index].isCompleted.toggle()
    }
  }
}
struct todolist: View {
  @StateObject private var viewModel = TodoListViewModel()
  @State private var newItemTitle = ""
  var body: some View {
    NavigationView {
      ZStack{
        Color(red: 0.278, green: 0.339, blue: 0.342)
        .edgesIgnoringSafeArea(.all)
        VStack {
          List {
            ForEach(viewModel.todoItems) { item in
              HStack {
                Button(action: {
                  viewModel.toggleTodoItemCompletion(todoItem: item)
                }) {
                  Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(item.isCompleted ? .blue : .primary)
                }
                .buttonStyle(PlainButtonStyle()) // Disable the button highlighting effect
                Text(item.title)
                  .strikethrough(item.isCompleted)
                Spacer()
                Button(action: {
                  if let index = viewModel.todoItems.firstIndex(where: { $0.id == item.id }) {
                    viewModel.todoItems.remove(at: index)
                  }
                }) {
                  Image(systemName: "trash.circle.fill")
                    .foregroundColor(.red)
                }
              }
            }
            .onDelete(perform: viewModel.deleteTodoItem)
            .background(.blue)
          }
          .listStyle(.plain)
          HStack {
            TextField("new item", text: $newItemTitle)
              .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
              viewModel.addTodoItem(title: newItemTitle)
              newItemTitle = ""
            }) {
              Image(systemName: "plus.circle.fill")
            }
            .foregroundColor(Color(red: 0.738, green: 0.64, blue: 0.676))
          }
          .padding()
        }
        .navigationTitle("todo list")
      }
    }
  }
}
struct todolist_Previews: PreviewProvider {
  static var previews: some View {
    todolist()
  }
}





