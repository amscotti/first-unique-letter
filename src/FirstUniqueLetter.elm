module FirstUniqueLetter exposing (firstUniqueLetter)

import List.Extra exposing (gatherEquals)


firstUniqueLetter : String -> Maybe Char
firstUniqueLetter word =
    word
        |> String.toList
        |> List.Extra.gatherEquals
        |> List.filter (Tuple.second >> List.isEmpty)
        |> List.map Tuple.first
        |> List.head
