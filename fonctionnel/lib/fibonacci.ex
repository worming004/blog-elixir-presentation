defmodule Fibonacci do
  @doc """
  iex> assert {:error, _} = Fibonacci.fibo(:foobar)

  iex> assert {:error, _} = Fibonacci.fibo(-5)
  iex> assert {:error, _} = Fibonacci.fibo(0)


  iex> assert 1 == Fibonacci.fibo(1)
  iex> assert 1 == Fibonacci.fibo(2)
  iex> assert 21 == Fibonacci.fibo(8)
  """
  # when calling Fibonacci(value), it will find the first method definition that match with input. 
  # If value is 1 or lesser, it will match with first function.
  def fibo(n) when n < 1 do 
    {:error, "value must be greater or equal to 1"}
  end
  # If value is not an integer, return an error 
  def fibo(n) when not is_integer(n) do 
    {:error, "only integer values are valid"}
  end
  # If value is 1, it will match this function
  def fibo(1), do: 1 
  # If value is 2, it will match this function
  def fibo(2), do: 1 
  # For all other values, meanings only integer greater than 2, it will match this function
  def fibo(n) do
    fibo(n-1) + fibo(n-2)
  end
end
