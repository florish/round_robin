RoundRobin
====

Generate a round robin schedule for any given group size.

Example

```elixir
RoundRobin.schedule_for_group_size(4)
# => [[[1, 2], [3, 4]], [[3, 1], [4, 2]], [[2, 3], [1, 4]]]
```

Output is structured as nested lists with rounds and matches:

```elixir
[
  [ # => round one
    [1, 2], #=> first match for round one
    [3, 4]
  ],
  [
    # round two, etc.
  ]
]
```

Background
====

The project was published to GitHub in answer to @feministy 's talk at Full Steck Fest Barcelona, in which she asked people to publish the first program they wrote after learning a new programming language.

So, be aware this is my first Elixir project and was created just for fun. If you're interested in actually using this logic in a system of your own, let me know!
