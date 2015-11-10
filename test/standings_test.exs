defmodule StandingsText do
  use ExUnit.Case

  import RoundRobin.Standings

  test "total_points returns total points per player" do
    assert total_points(players, results) == [a: 3, b: 0, c: 3]
  end

  test "results_to_points maps results to competition points" do
    assert results_to_points(results) == [a: 2, b: 0, c: 1, a: 1, b: 0, c: 2]
  end

  test "player_total returns total points for given player" do
    assert player_total(:a, [a: 1, b: 2, a: 3, c: 0]) == 4
  end

  def players do
    [:a, :b, :c]
  end

  def results do
    [
      [a: 2, b: 0],
      [c: 1, a: 1],
      [b: 1, c: 2]
    ]
  end
end
