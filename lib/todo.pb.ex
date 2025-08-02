defmodule TodoPackage.Void do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule TodoPackage.TodoItem do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:text, 2, type: :string)
end

defmodule TodoPackage.TodoItems do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field(:items, 1, repeated: true, type: TodoPackage.TodoItem)
end

defmodule TodoPackage.TodoService.Service do
  @moduledoc false

  use GRPC.Service, name: "todoPackage.TodoService", protoc_gen_elixir_version: "0.14.0"

  rpc(:createTodo, TodoPackage.TodoItem, TodoPackage.TodoItem)

  rpc(:readTodos, TodoPackage.Void, stream(TodoPackage.TodoItems))
end

defmodule TodoPackage.TodoService.Stub do
  @moduledoc false

  use GRPC.Stub, service: TodoPackage.TodoService.Service
end
