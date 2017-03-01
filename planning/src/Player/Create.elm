module Player.Create exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, placeholder)
import Html.Events exposing (onInput)
import Player.Msgs exposing (Msg)
import Models exposing (Player)
import Routing exposing (playersPath)


view : Player -> Html Msg
view model =
    div []
        [ nav model
        , form model
        ]


nav : Player -> Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1" ]
        [ listBtn ]


form : Player -> Html Msg
form player =
    div [ class "m3" ]
        [ h1 [] [ text "Create New Player" ]
        , formLevel player
        ]


listBtn : Html Msg
listBtn =
    a
        [ class "btn regular"
        , href playersPath
        ]
        [ i [ class "fa fa-chevron-left mr1" ] [], text "List" ]


formLevel : Player -> Html Msg
formLevel player =
    div
        [ class "clearfix py1"
        ]
        [ div [ class "col col-1" ] [ text player.id ]
        , div [ class "col col-2" ] [ input [ placeholder "Name", onInput Player.Msgs.Name ] [] ]
        , div [ class "col col-3" ] [ input [ placeholder "Level", onInput Player.Msgs.Level ] [] ]
        ]
