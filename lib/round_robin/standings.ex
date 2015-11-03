defmodule RoundRobin.Standings do
  def total_points(players, results) do
    x = results_to_points(results)
    players
    |> Enum.map(&({&1, player_total(&1, x)}))
  end

  def results_to_points(results) do
    results
    |> Enum.flat_map &(result_points(&1))
  end

  def result_points([{p1, score1}, {p2, score2}]) when score1 > score2 do
    [{p1, 2}, {p2, 0}]
  end

  def result_points([{p1, score1}, {p2, score2}]) when score1 == score2 do
    [{p1, 1}, {p2, 1}]
  end

  def result_points([{p1, score1}, {p2, score2}]) when score1 < score2 do
    [{p1, 0}, {p2, 2}]
  end

  def base_player_points(players) do
    Enum.map players, &({&1, 0})
  end

  def player_total(player, points) do
    Enum.filter(points, fn({ply, pts}) -> ply == player end)
    |> Enum.reduce(0, fn({ply, pts}, acc) -> acc + pts end)
  end
end
