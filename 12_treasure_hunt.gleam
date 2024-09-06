import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1, place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location.0 == treasure_location.1 &&
  treasure_location.0 == place_location.1
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let #(_, place_location) = place
  let treasure_location = place_location_to_treasure_location(place_location)
  list.filter(treasures, fn(treasure) { treasure.1 == treasure_location })
  |> list.length
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case found_treasure, desired_treasure, place {
    #("Brass Spyglass", _), _, #("Abandoned Lighthouse", _) -> True
    #("Amethyst Octopus", _), #("Crystal Crab", _), #("Stormy Breakwater", _) -> True
    #("Amethyst Octopus", _), #("Glass Starfish", _), #("Stormy Breakwater", _) -> True
    #("Vintage Pirate Hat", _), #("Model Ship in Large Bottle", _), #("Harbor Managers Office", _) -> True
    #("Vintage Pirate Hat", _), #("Antique Glass Fishnet Float", _), #("Harbor Managers Office", _) -> True
    _, _, _ -> False
  }
}
