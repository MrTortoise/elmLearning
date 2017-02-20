module Hello exposing (..)

import Html exposing (text)


main : Html.Html msg
main =
  text "Hello"


type OtherAnswer = DontKnow | Perhaps | Undecided

type Answer = Yes | No | Other OtherAnswer

respond : Answer -> String
respond answer =
  case answer of
     Yes -> "Yes"
     (Other DontKnow) -> "dunno"
     _ -> "somethingelse"

type alias Message a =
  {code : String,
  body : a
}

readMessage : Message String -> String
readMessage message =
