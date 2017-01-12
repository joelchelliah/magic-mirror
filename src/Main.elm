module Main exposing (..)

import Html exposing (program)
import Model exposing (Model, init)
import Update exposing (update)
import View exposing (view)
import Subscription exposing (subscriptions, getPlace)


main : Program Never Model Subscription.Msg
main = let name = "Kalbakken"
       in  program { init = (init name, getPlace name)
                   , update = update
                   , view = view
                   , subscriptions = subscriptions
                   }
