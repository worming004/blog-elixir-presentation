defmodule Ping do
  use GenServer

  @impl true
  def init(initial_value) when is_integer(initial_value) do
    {:ok, %{count: initial_value}}
  end

  @impl true
  def init(_) do
    init(0)
  end

  def start_link(initial_value) do
    GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
  end

  @impl true
  def handle_call(:ping, _from, state) do
    state = Map.update!(state, :count, fn field -> field + 1 end)
    {:reply, {:pong, count: state.count}, state}
  end

  @impl true
  def handle_call(:get_count, _from, state) do
    {:reply, state.count, state}
  end

  def ping(pid) do
    Process.sleep(500)
    GenServer.call(pid, :ping)
  end

  def get_current_count(pid) do
    GenServer.call(pid, :get_count)
  end
end
