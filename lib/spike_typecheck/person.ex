defmodule SpikeTypecheck.Person do
  use TypeCheck
  use TypeCheck.Defstruct

  defstruct!(
    name: _ :: String.t(),
    age: _ :: non_neg_integer(),
    happy?: true :: boolean(),
    phone: _ :: String.t()
  )

  @spec! new(map()) :: t()
  def new(attrs) do
    struct(__MODULE__, attrs)
  end
end
