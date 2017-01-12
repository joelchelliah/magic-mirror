module Subscription exposing (..)

import Model exposing (..)
import Json.Decode as Json exposing (..)
import Http

type Msg
    = MorePlease
    | NewPlaces (Result Http.Error (List String))

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

getPlace : String -> Cmd Msg
getPlace name =
    let url = "http://reisapi.ruter.no/Place/GetPlaces/" ++ name
    in  Http.send NewPlaces (Http.get url placeDecoder)


placeDecoder : Json.Decoder (List String)
placeDecoder =
    Json.list <|
    Json.map2 (\id name -> id ++ ", " ++ name)
              (field "Name" Json.string)
              (field "District" Json.string)
