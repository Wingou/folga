module Command exposing (..)

import Modele exposing (..)
import String exposing (left)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None  ->
            
                    (  model
                    , Cmd.none
                    )
