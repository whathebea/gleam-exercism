pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}
pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(pizza_flavour) -> 1 + pizza_price(pizza_flavour)
    ExtraToppings(pizza_flavour) -> 2 + pizza_price(pizza_flavour)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case order {
    [pizza_flavour] -> pizza_price(pizza_flavour) + 3
    [pizza_flavour_one, pizza_flavour_two] -> pizza_price(pizza_flavour_one) + pizza_price(pizza_flavour_two) + 2
    [pizza_flavour_one, pizza_flavour_two, pizza_flavour_three] -> pizza_price(pizza_flavour_one) + pizza_price(pizza_flavour_two) + pizza_price(pizza_flavour_three)
    [pizza_flavour, ..rest] -> pizza_price(pizza_flavour) + order_price(rest)
    [] -> 0
  }
}
