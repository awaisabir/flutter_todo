import "./Todo.dart";

class TodoList {
  List<Todo> todos;

  TodoList() {
    this.todos = new List();
  }

  List<Todo> getTodos() { return this.todos; }

  void addTodo(Todo todo) {
    this.todos.add(todo);
  }

  void removeTodo(String id) {
    this.todos.removeWhere((todo) => todo.getId() == id);
  }

  Todo getTodoByIndex(int index) {
    return this.todos.elementAt(index);
  }

  Todo getTodoById(String id) {
    List<Todo> todosWithId = this.todos.where((todo) => todo.getId() == id);

    return todosWithId.elementAt(0);
  }
}