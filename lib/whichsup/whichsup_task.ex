defmodule Whichsup.Task do
  use Task, restart: :permanent

  def start_link(_) do
    Task.start_link(__MODULE__, :run, [1000])
  end

  def run(delay) do
    IO.puts("Heartbeat from the Supervised Task")
    Process.sleep(delay)
    run(delay)
  end
end
