module View exposing (..)

import Config exposing (apiPath)
import Css exposing (..)
import Html exposing (..)
import Html.Attributes exposing (disabled, href, placeholder, target, title, type_, value)
import Html.Events exposing (onClick, onInput)
import Http exposing (Error(..))
import Maybe exposing (withDefault)
import Modele exposing (..)
import Html.Attributes exposing (style)


view : Model -> Html Msg
view model =
    div []
        [ header model
        , div [] [          
                        input [style "font-size" "0.80rem" 
                                    ,  placeholder "Enter Source Path"
                                    , onInput SetSourcePath ]
                                    [] 
                            ]
        , div [] [          
                        input [style "font-size" "0.80rem" 
                                    ,  placeholder "Enter Dest Path"
                                    , onInput SetDestPath ]
                                    [] 
                            ]

        , div [][ text <| model.input.destPath]
        , footer model
        ]


header : Model -> Html Msg
header _ =
    div
        (flexColumn
            ++ css
                [ TextAlign "center"
                , FontFamily "verdana"
                , FontSize "0.5rem"
                ]
        )
        [ div [] [ text "FOLGA" ]
  
        ]


footer : Model -> Html Msg
footer _ =
    div
        (flexColumn
            ++ css
                [ TextAlign "center"
                , FontFamily "verdana"
                , FontSize "0.5rem"
                ]
        )
        [ div [] [ text "FOLGA" ]
        , div [] [ text "WTL - 23/06/2023" ]
        ]
