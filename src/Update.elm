module Update exposing (..)

import Model exposing (..)
import Subscription exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MorePlease ->
            ( model, getPlace model.name )
        NewPlaces (Ok newPlaces) ->
            ( { model | places = newPlaces }, Cmd.none )
        NewPlaces (Err _) ->
            ( model, Cmd.none )
