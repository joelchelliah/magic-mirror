module View exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import Subscription exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text model.name ]
        , button [ class "place-btn", onClick MorePlease ] [ text "More!" ]
        , br [] []
        , br [] []
        , div [class "place-list"] <| List.map (\p -> div [] [ text p ]) model.places
        ]
