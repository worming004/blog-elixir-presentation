defmodule Person do
  defstruct name: nil, age: nil

  # it return {:ok, Person} tuple if age is valid. Or {:error, string_reason} if age is invalid
  def new(name, age) do
    case age do
      age when age < 0 -> {:error, "cannot create person of negative age"}
      _ -> {:ok, %Person{name: name, age: age}}
    end
  end

  # By convention, the ! means that behavior is similar than without it, but we removed the :ok part, and raise error instead of returning {:error, string_reason} tuple
  def new!(name, age) do
    case new(name, age) do
      {:ok, person} -> person
      {:error, message} -> raise ArgumentError, message
    end
  end

  # multiline function, with executable documentation
  @doc """
  This is where documentation can be produced. From here, a REPL can ask for help on this function, and it will return this text.
  More, with the help of /test/person_test.exs file, the next blocks are unit tested AND onto documentation. All tests present different syntax in order to create a new Person, and increment age

  iex> p = Person.new!("john", 33)
  ...> p = Person.increment_age(p)
  ...> assert 34 == p.age

  iex> {:ok, p} = Person.new("john", 33)
  ...> p = Person.increment_age(p)
  ...> assert 34 == p.age

  iex> p = Person.new!("john", 33) |> Person.increment_age()
  ...> assert 34 == p.age

  iex> p = Person.new!("john", 33)
  ...> Person.increment_age(p)
  ...> assert 33 == p.age # p is not reassigned, so it still hold the previous value
  """
  def increment_age(p = %Person{}) do
    # latest expression un function is the returned value
    increment_func = fn age -> age + 1 end
    Map.update!(p, :age, increment_func)
  end
end
