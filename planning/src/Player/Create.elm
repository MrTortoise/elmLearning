module Player.Create exposing (..)

import Html exposing (..)
import Models exposing (Player)
import Routing exposing (playersPath)


view : Player -> Html Msg
view model =
    div []
        [ nav model
        , from model
        ]


nav : Player -> Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1" ]
        [ listBtn ]
