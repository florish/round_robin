defmodule RoundRobin do
  require Integer

  def schedule_for_group_size(n) when n < 2 do
    []
  end

  def schedule_for_group_size(2) do
    [[1,2]]
  end

  def schedule_for_group_size(n) when n >= 2 do
    0..rounds_needed(n)
      |> Enum.map &(members_for_round(n, &1))
      |> matches_from_members n
  end

  def rounds_needed(n) do
    n - 2 + rem(n,2)
  end

  def matches_from_members(members, n) do
    if Integer.is_even(n) do
      match_converger(Enum.take(members, n - 2)) ++ [[Enum.at(members, -2), Enum.at(members, -1)]]
    else
      match_converger(Enum.take(members, n - 1))
    end
  end

  def match_converger(l) when length(l) < 2 do
    []
  end

  def match_converger([head | tail]) do
    tail_without_last = Enum.take(tail, length(tail) - 1)
    [[head, List.last(tail)] | match_converger(tail_without_last)]
  end

  def members_for_round(n, round) when rem(n, 2) == 0 do
    circle = shuffle_members_for_round(1..n-1, round)
    if Integer.is_even(round) do
      circle ++ [n]
    else
      { a, b } = Enum.split(circle, -1)
      a ++ [n] ++ b
    end
  end

  def members_for_round(n, round) when rem(n, 2) == 1 do
    shuffle_members_for_round(1..n, round)
  end

  def shuffle_members_for_round(members, round) do
    {a, b} = Enum.split(members, -1 * round)
    b ++ a
  end
end
