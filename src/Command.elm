module Command exposing (..)

import Modele exposing (..)
import String exposing (left)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        inputsModel = model.input
    in
    case msg of


        SetSourcePath p ->
                    let

                        input_ = {inputsModel | sourcePath = p}
                    in
            
                    (  {model  | input = input_ }
                    , Cmd.none
                    )

        SetDestPath p -> 
            let

                        input_ = {inputsModel | destPath = p}
            in
            (    {model  | input = input_ }
                    , Cmd.none
                    )
