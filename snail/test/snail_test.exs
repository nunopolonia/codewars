defmodule SnailTest do
  use ExUnit.Case

  test "empty matrix" do
    assert Snail.snail( [ [] ] ) == []
  end

  test "3x3" do
    matrix = [ [ 1, 2, 3 ],
               [ 4, 5, 6 ],
               [ 7, 8, 9 ]
             ]

    assert Snail.snail( matrix ) == [ 1, 2, 3, 6, 9, 8, 7, 4, 5 ]
  end

  test "5x5" do
    matrix = [ [  1,  2,  3,  4,  5 ],
               [  6,  7,  8,  9, 10 ],
               [ 11, 12, 13, 14, 15 ],
               [ 16, 17, 18, 19, 20 ],
               [ 21, 22, 23, 24, 25 ]
             ]

    assert Snail.snail( matrix ) ==
      [ 1, 2, 3, 4, 5, 10, 15, 20, 25, 24, 23, 22, 21, 16, 11, 6, 7, 8, 9, 14, 19, 18, 17, 12, 13 ]
  end

  test "6x6" do
    matrix = [ [  1,  2,  3,  4,  5,  6 ],
               [ 20, 21, 22, 23, 24,  7 ],
               [ 19, 32, 33, 34, 25,  8 ],
               [ 18, 31, 36, 35, 26,  9 ],
               [ 17, 30, 29, 28, 27, 10 ],
               [ 16, 15, 14, 13, 12, 11 ]
             ]

    assert Snail.snail( matrix ) == Enum.to_list( 1..36 )
  end
end
