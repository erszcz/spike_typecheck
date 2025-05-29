defmodule SpikeTypecheck.Impl2 do
  use TypeCheck

  @behaviour SpikeTypecheck.Bh

  @impl true
  @spec! do_stuff(pos_integer()) :: String.t()
  def do_stuff(n) do
    to_string(n + 1)
  end

  @impl true
  @spec! do_other_stuff(integer()) :: integer()
  def do_other_stuff(n) do
    n * 2
  end
end
