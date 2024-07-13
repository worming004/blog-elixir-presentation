defmodule Ping do
  use GenServer

  @impl true
  def init(_) do
    {:ok, %{count: 0}}
  end

  @impl true
  def handle_call(:ping, _from, state) do
    state = Map.update!(state, :count, &(&1 + 1))
    {:reply, {:pong, count: state.count}, state}
  end

  def ping(pid) do
    Process.sleep(500)
    GenServer.call(pid, :ping)
  end
end
