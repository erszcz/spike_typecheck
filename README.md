# SpikeTypecheck

```
$ time mix compile --force
Compiling 5 files (.ex)
@enforce_keys [:name, :age, :phone]
defstruct [:name, :age, {:happy?, true}, :phone]

TypeCheck.Macros.type!(
  t() :: %SpikeTypecheck.Person{
    name: String.t(),
    age: non_neg_integer(),
    happy?: boolean(),
    phone: String.t()
  }
)
Generated spike_typecheck app

real	0m0.551s
user	0m0.604s
sys	0m1.167s
```

```elixir
iex> SpikeTypecheck.Impl.do_stuff(3)
"3"
iex> SpikeTypecheck.Impl.do_stuff(:z)
** (TypeCheck.TypeError) At lib/spike_typecheck/impl.ex:1:
    The call to `do_stuff/1` failed,
    because parameter no. 1 does not adhere to the spec `pos_integer()`.
    Rather, its value is: `:z`.
    Details:
      The call `do_stuff(:z)`
      does not adhere to spec `do_stuff(pos_integer()) :: String.t()`. Reason:
        parameter no. 1:
          `:z` is not a positive integer.
    (spike_typecheck 0.1.0) deps/type_check/lib/type_check/spec.ex:243: anonymous fn/2 in SpikeTypecheck.Impl.do_stuff/1
    iex:3: (file)
iex> Person.new(%{})
** (TypeCheck.TypeError) The call to `new/1` failed,
    because the returned result does not adhere to the spec `SpikeTypecheck.Person.t()`.
    Rather, its value is: `%SpikeTypecheck.Person{name: nil, age: nil, happy?: true, phone: nil}`.
    Details:
      The result of calling `new(%{})`
      does not adhere to spec `new(%{optional(any()) => any()}) :: SpikeTypecheck.Person.t()`. Reason:
        Returned result:
          `%SpikeTypecheck.Person{name: nil, age: nil, happy?: true, phone: nil}` does not match the definition of the named type `SpikeTypecheck.Person.t()`
          which is: `SpikeTypecheck.Person.t()
          ::
          %SpikeTypecheck.Person{
            name: String.t(),
            age: non_neg_integer(),
            happy?: boolean(),
            phone: String.t()
          }`. Reason:
            `%SpikeTypecheck.Person{name: nil, age: nil, happy?: true, phone: nil}` does not check against `%SpikeTypecheck.Person{
              name: String.t(),
              age: non_neg_integer(),
              happy?: boolean(),
              phone: String.t()
            }`. Reason:
              under key `:age`:
                `nil` is not a non-negative integer.
    (spike_typecheck 0.1.0) deps/type_check/lib/type_check/spec.ex:278: SpikeTypecheck.Person.new/1
    iex:1: (file)
iex> Person.new(%{name: "Join", age: 20, phone: "123-456-789"})
%SpikeTypecheck.Person{
  name: "Join",
  age: 20,
  happy?: true,
  phone: "123-456-789"
}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `spike_typecheck` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:spike_typecheck, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/spike_typecheck>.

