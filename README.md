# TodoApp gRPC Example

Welcome! 👋

This project is a simple experimental playground for learning and experimenting with [gRPC](https://grpc.io/) in Elixir.  
It provides a minimal starting point for anyone interested in understanding how to build gRPC services and clients using Elixir.

## What is this?

- A basic Todo application with gRPC endpoints.
- Demonstrates how to define, implement, and consume gRPC services in Elixir.
- Intended as a learning resource and a starting point for your own gRPC experiments.

## Features

- Simple gRPC server exposing Todo operations (create, read).
- Example client scripts for interacting with the server.
- Minimal dependencies and easy to understand structure.

## Getting Started

1. **Clone this repository**
2. **Install dependencies:**  
   ```sh
   mix deps.get
   ```
3. **Run the server:**  
   ```sh
   mix run --no-halt
   ```
4. **Try the example client scripts in the `scripts/` folder.**
   ```sh
   mix run --no-start scripts/create_todo_client.exs
   ```