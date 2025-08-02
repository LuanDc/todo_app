defmodule TodoApp.Server do
  use GRPC.Server, service: TodoPackage.TodoService.Service

  alias TodoPackage.TodoItem
  alias TodoApp.TodoItemsRepo

  @spec read_todos(GRPC.Server.Stream.t(), GRPC.Server.Stream.t()) :: GRPC.Server.Stream.t()
  def read_todos(_request, stream) do
    todos = TodoItemsRepo.read_todo_items()
    todo_items = %TodoPackage.TodoItems{items: todos}
    GRPC.Server.send_reply(stream, todo_items)
  end

  @spec create_todo(TodoItem.t(), GRPC.Server.Stream.t()) :: TodoItem.t()
  def create_todo(todo_item, _stream) do
    count = TodoItemsRepo.count_todo_items()
    todo_item = %TodoItem{id: count + 1, text: todo_item.text}
    TodoItemsRepo.create_todo_item(todo_item)
    todo_item
  end
end
