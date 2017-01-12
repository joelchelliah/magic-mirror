module Model exposing (..)

type alias Model =
    { name : String
    , places : List String
    }

init : String -> Model
init name = Model name []
