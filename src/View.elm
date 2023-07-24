module View exposing (..)

import Config exposing (apiPath)
import Css exposing (..)
import Html exposing (..)
import Html.Attributes exposing (disabled, href, placeholder, target, title, type_, value)
import Html.Events exposing (onClick, onInput)
import Http exposing (Error(..))
import Maybe exposing (withDefault)
import Modele exposing (..)


view : Model -> Html Msg
view model =
    let
        cssCell =
            flex 1 ++ css [ Border "0.1rem", BorderColor Black ]
    in
    div []
        [ header model
        , div [] <|
            div (flexRow ++ css [ BorderColor Black ])
                [ div cssCell
                    [ text "Date" ]
                , div cssCell
                    [ text "Prix" ]
           
                ]
                :: List.map
                    (\e ->

                        div (flexRow ++ css [ BorderColor Black ])
                            [ div cssCell
                                [ text <| e.name ]
                            
                            , div cssCell
                                [ text e.path ]
                            
                            ]
                    )
                    model.elements
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
