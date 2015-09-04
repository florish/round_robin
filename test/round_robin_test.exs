defmodule RoundRobinTest do
  use ExUnit.Case

  import RoundRobin

  test "schedule_for_group_size return 0 matches for 0 member group" do
    assert schedule_for_group_size(0) == []
  end

  test "schedule_for_group_size return 0 matches for 1 member group" do
    assert schedule_for_group_size(1) == []
  end

  test "schedule_for_group_size returns 1 match for 2 member group" do
    assert schedule_for_group_size(2) == [[1,2]]
  end

  test "schedule_for_group_size returns 3 matches for 3 member group" do
    assert schedule_for_group_size(3) == [[[1,2]], [[3,1]], [[2,3]]]
  end

  test "schedule_for_group_size returns 6 matches for 4 member group" do
    assert schedule_for_group_size(4) == [[[1,2], [3,4]], [[3,1], [4,2]], [[2,3], [1,4]]]
  end
end
