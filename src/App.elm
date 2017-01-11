module App exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json exposing (..)
import Http


type alias Model =
    { name : String
    , places : List String
    }


init : String -> ( Model, Cmd Msg )
init name =
    ( Model name []
    , getPlace name
    )


type Msg
    = MorePlease
    | NewPlaces (Result Http.Error (List String))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MorePlease ->
            ( model, getPlace model.name )

        NewPlaces (Ok newPlaces) ->
            ( { model | places = newPlaces }, Cmd.none )

        NewPlaces (Err _) ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text model.name ]
        , button [ onClick MorePlease ] [ text "More Please!" ]
        , br [] []
        , div [] <| List.map (\p -> div [] [ text p ]) model.places
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


getPlace : String -> Cmd Msg
getPlace name =
    let
        url =
            "http://reisapi.ruter.no/Place/GetPlaces/" ++ name
    in
        Http.send NewPlaces (Http.get url placeDecoder)


placeDecoder : Json.Decoder (List String)
placeDecoder =
    Json.list <|
        Json.map2
            (\id name -> id ++ ", " ++ name)
            (field "Name" Json.string)
            (field "District" Json.string)
