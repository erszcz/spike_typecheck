defmodule SpikeTypecheck.Impl do
  use TypeCheck

  @behaviour SpikeTypecheck.Bh

  @impl true
  @spec! do_stuff(pos_integer()) :: String.t()
  def do_stuff(n) do
    to_string(n)
  end
end
