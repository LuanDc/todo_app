Application.ensure_all_started(:grpc)

{:ok, channel} = GRPC.Stub.connect("localhost:50051")
todo_item = %TodoPackage.TodoItem{text: "Minha tarefa via script"}
TodoPackage.TodoService.Stub.create_todo(channel, todo_item)

{:ok, stream} = TodoPackage.TodoService.Stub.read_todos(channel, %TodoPackage.Void{})
IO.inspect(Enum.map(stream, & &1))
