defmodule TodoApp.TodoItemsRepo do
  use Agent

  @initial_state []

  def start_link(_state) do
    Agent.start_link(fn -> @initial_state end, name: __MODULE__)
  end

  def count_todo_items do
    Agent.get(__MODULE__, &length/1)
  end

  def read_todo_items do
    Agent.get(__MODULE__, & &1)
  end

  def create_todo_item(todo_item) do
    Agent.update(__MODULE__, fn state ->
      [%{id: length(state) + 1, text: todo_item.text} | state]
    end)
  end
end
