module View exposing (..)

import Html exposing (Html, div, text)
import Models exposing (Model, PlayerId, Player)
import Msgs exposing (Msg)
import Player.Edit
import Player.List
import Player.Create
import RemoteData


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.PlayersRoute ->
            Player.List.view model.players

        Models.PlayerRoute id ->
            playerEditPage model id

        Models.CreatePlayerRoute ->
            Player.Create.view

        Models.NotFoundRoute ->
            notFoundView


playerEditPage : Model -> PlayerId -> Html Msg
playerEditPage model playerId =
    case model.players of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading ..."

        RemoteData.Success players ->
            let
                maybePlayer =
                    players
                        |> List.filter (\player -> player.id == playerId)
                        |> List.head
            in
                case maybePlayer of
                    Just player ->
                        Player.Edit.view player

                    Nothing ->
                        notFoundView

        RemoteData.Failure err ->
            text (toString err)


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not Found"
        ]
