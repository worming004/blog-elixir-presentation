defmodule Pong do
  use GenServer

  @impl true
  def init(_) do
    {:ok, %{count: 0}}
  end

  @impl true
  def handle_call(:pong, _from, state) do
    state = Map.update!(state, :count, &(&1 + 1))
    {:reply, {:ping, count: state.count}, state}
  end

  def pong(pid) do
    Process.sleep(500)
    GenServer.call(pid, :pong)
  end
end
