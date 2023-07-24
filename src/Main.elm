module Main exposing (..)

import Browser
import Command exposing (update)
import Html exposing (..)
import Modele exposing (Model, Msg, initialModel)
 
import View exposing (view)


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( initialModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }
