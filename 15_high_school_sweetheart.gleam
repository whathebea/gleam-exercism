import gleam/list
import gleam/string

pub fn first_letter(name: String) {
  name
  |> string.trim
  |> string.slice(at_index: 0, length: 1)
}

pub fn initial(name: String) {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  full_name
  |> string.split(" ")
  |> initials_formated
}

pub fn initials_formated(x: List(String)) -> String {
  case x {
    [x, y] -> string.join([initial(x), initial(y)], with: " ")
    _ -> " "
  }
}

pub fn pair(full_name1: String, full_name2: String) {
  let heart =
    "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     X. Y.  +  X. X.     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
    |> string.replace(each: "X. Y.", with: initials(full_name1))
    |> string.replace(each: "X. X.", with: initials(full_name2))
}
