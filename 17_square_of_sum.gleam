import gleam/int
import gleam/iterator

pub fn square_of_sum(n: Int) -> Int {
  let sum =
    iterator.range(1, n)
    |> iterator.to_list
    |> int.sum
  sum * sum
}

pub fn sum_of_squares(n: Int) -> Int {
  let sum =
    iterator.range(1, n)
    |> iterator.map(fn(n) { n * n })
    |> iterator.to_list
    |> int.sum
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
