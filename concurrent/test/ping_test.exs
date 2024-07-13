defmodule PingTest do
  use ExUnit.Case, async: true

  test "ping respond with pong" do
    {:ok, pid} = start_supervised(Ping, [])
    assert {:pong, [count: 1]} == Ping.ping(pid)
    assert {:pong, [count: 2]} == Ping.ping(pid)
  end

  test "ping respond with correct count" do
    {:ok, pid} = start_supervised(Ping, [])
    assert {:pong, [count: 1]} == Ping.ping(pid)
    assert 1 == Ping.get_current_count(pid)
  end

  test "ping server start with expected setup" do
    {:ok, pid} = start_supervised({Ping, 5}, [])
    assert 5 == Ping.get_current_count(pid)
  end
end
