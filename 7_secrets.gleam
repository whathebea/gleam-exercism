pub fn secret_add(secret: Int) -> fn(Int) -> Int {
  let adder = fn(x: Int) { x + secret }
}

pub fn secret_subtract(secret: Int) -> fn(Int) -> Int {
  let subtractor = fn(x: Int) { x - secret }
}

pub fn secret_multiply(secret: Int) -> fn(Int) -> Int {
  let multiplier = fn(x: Int) { x * secret }
}

pub fn secret_divide(secret: Int) -> fn(Int) -> Int {
  let divider = fn(x: Int) { x / secret }
}

pub fn secret_combine(
  secret_function1: fn(Int) -> Int,
  secret_function2: fn(Int) -> Int,
) -> fn(Int) -> Int {
  let combiner = fn(x: Int) { secret_function2(secret_function1(x)) }
}
