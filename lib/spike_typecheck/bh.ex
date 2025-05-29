defmodule SpikeTypecheck.Bh do
  @optional_callbacks do_other_stuff: 1

  @callback do_stuff(pos_integer()) :: String.t()

  @callback do_other_stuff(integer()) :: integer()
end
