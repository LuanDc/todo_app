defmodule TodoApp.Endpoint do
  use GRPC.Endpoint

  intercept(GRPC.Server.Interceptors.Logger)
  run(TodoApp.Server)
end
