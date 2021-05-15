defmodule Whichsup.Genserver do
  use GenServer
  @self __MODULE__

  def start_link(_) do
    GenServer.start_link(@self, 1000, name: @self)
  end

  def init(delay) do
    Process.send_after(@self, :heartbeat, delay)
    {:ok, delay}
  end

  def handle_info(:heartbeat, delay) do
    IO.puts("Heartbeat from the GenServer")
    Process.send_after(@self, :heartbeat, delay)
    {:noreply, delay}
  end
end
