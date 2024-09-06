pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [birds_today, ..] -> birds_today
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [today, ..rest] -> [today + 1, ..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [0, ..] -> True
    [_, ..rest] -> has_day_without_birds(rest)
    [] -> False
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [today, ..rest] -> today + total(rest)
    [] -> 0
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [today, ..rest] if today > 4 -> busy_days(rest) + 1
    [_, ..rest] -> busy_days(rest)
    [] -> 0
  }
}
