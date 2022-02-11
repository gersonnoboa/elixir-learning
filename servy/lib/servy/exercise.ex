# defmodule Recurse do
#   def loopy([head | tail]) do
#     IO.puts("Head: #{head} Tail: #{inspect(tail)}")
#     loopy(tail)
#   end

#   def loopy([]), do: IO.puts("Done!")

#   def sum([head | tail], total) do
#     sum(tail, total + head)
#   end

#   def sum([], total), do: IO.puts("Result is #{total}")

#   def triple([head | tail]) do
#     [head * 3 | triple(tail)]
#   end

#   def triple([]), do: []

#   def my_map([head | tail], function) do
#     [function.(head) | my_map(tail, function)]
#   end

#   def my_map([], _function), do: []
# end

# Recurse.loopy([1, 2, 3, 4, 5])
# Recurse.sum([1, 2, 3, 4, 5], 0)
# IO.inspect Recurse.triple([1, 2, 3, 4, 5])
# IO.inspect(Recurse.my_map([1, 2, 3], &(&1 * 3)))

defmodule Timer do
  def remind(reminder, seconds) do
    spawn(fn ->
      :timer.sleep(seconds * 1000)
      IO.puts(reminder)
    end)
  end
end

Timer.remind("Stand Up", 5)
Timer.remind("Sit Down", 10)
Timer.remind("Fight, Fight, Fight", 15)
