defmodule FibonacciTest do
  use ExUnit.Case, async: true
  doctest Fibonacci

  test "2 first positions are equals to 1" do
    assert 1 == Fibonacci.fibo(1)
    assert 1 == Fibonacci.fibo(2)
  end

  test "fibonacci of 10 is 55" do
    assert 55 == Fibonacci.fibo(10)
  end

  test "fibonacci of 15 is 610" do
    assert 610 == Fibonacci.fibo(15)
  end

  # There is way to produce a single assert, and give different values in this test as inputs. But keep it simple for today
  test "values other than integer are invalid" do
    assert {:error, _} = Fibonacci.fibo(:foo)
    assert {:error, _} = Fibonacci.fibo("foo")
    assert {:error, _} = Fibonacci.fibo([])
    assert {:error, _} = Fibonacci.fibo(%{})
  end

  test "integers lesser than 1 are invalid" do
    assert {:error, _} = Fibonacci.fibo(0)
    assert {:error, _} = Fibonacci.fibo(-5)
  end
end
