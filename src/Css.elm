module Css exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style)
import Modele exposing (..)


type MainColor
    = Red
    | Orange
    | Yellow
    | Green
    | Blue
    | Violet
    | Black
    | White
    | LightYellow
    | LightGray
    | Whitesmoke
    | Skyblue
    | Seashell
    | Aliceblue
    | Azure
    | LightGreen
    | Gray
    | DarkBlue
    | Gainsboro
    | PaleGreen
    | CustomGreen


mainColor : MainColor -> String
mainColor v =
    case v of
        Red ->
            "Red"

        Orange ->
            "Orange"

        Yellow ->
            "Yellow"

        Green ->
            "Green"

        Blue ->
            "Blue"

        Violet ->
            "Violet"

        Black ->
            "Black"

        White ->
            "White"

        LightGray ->
            "LightGray"

        Gray ->
            "Gray"

        LightYellow ->
            "LightYellow"

        Whitesmoke ->
            "Whitesmoke"

        Skyblue ->
            "Skyblue"

        Seashell ->
            "Seashell"

        Aliceblue ->
            "Aliceblue"

        Azure ->
            "Azure"

        LightGreen ->
            "LightGreen"

        DarkBlue ->
            "DarkBlue"

        Gainsboro ->
            "Gainsboro"

        PaleGreen ->
            "PaleGreen"

        CustomGreen ->
            "#ebfce8"


type Style
    = Bgcolor MainColor
    | BorderColor MainColor
    | TextAlign String
    | Color MainColor
    | FontStyle String
    | FontFamily String
    | FontSize String
    | FontWeight String
    | DisplayFlex
    | Width String
    | Height String
    | JustifyContent String
    | FlexDirection String
    | Flex String
    | MarginTop String
    | Padding String
    | PaddingRight String
    | PaddingLeft String
    | Italic
    | Bold
    | Border String
    | Margin String
    | MarginRight String
    | MarginBottom String
    | MarginLeft String
    | BdRadius String


css : List Style -> List (Attribute msg)
css styles =
    List.map
        (\style_ ->
            case style_ of
                Bgcolor v ->
                    style "background-color" <| mainColor v

                BorderColor v ->
                    style "border-color" <| mainColor v

                TextAlign v ->
                    style "text-align" v

                Color v ->
                    style "color" <| mainColor v

                FontStyle v ->
                    style "font-style" v

                Italic ->
                    style "font-style" "italic"

                Bold ->
                    style "font-weight" "bold"

                FontFamily v ->
                    style "font-family" v

                FontSize v ->
                    style "font-size" v

                FontWeight v ->
                    style "font-weight" v

                DisplayFlex ->
                    style "display" "flex"

                Width v ->
                    style "width" v

                Height v ->
                    style "height" v

                JustifyContent v ->
                    style "justify-content" v

                FlexDirection v ->
                    style "flexDirection" v

                Flex v ->
                    style "flex" v

                Margin v ->
                    style "margin" v

                MarginTop v ->
                    style "margin-top" v

                MarginRight v ->
                    style "margin-right" v

                MarginLeft v ->
                    style "margin-left" v

                Padding v ->
                    style "padding" v

                PaddingRight v ->
                    style "padding-right" v

                PaddingLeft v ->
                    style "padding-left" v

                Border v ->
                    style "border" <| v ++ " solid"

                MarginBottom v ->
                    style "margin-bottom" v

                BdRadius v ->
                    style "border-radius" v
        )
        styles


flexDir : String -> List (Attribute msg)
flexDir v =
    css [ DisplayFlex, FlexDirection v ]


flexColumn : List (Attribute msg)
flexColumn =
    flexDir "column"


flexRow : List (Attribute msg)
flexRow =
    flexDir "row"


flex : Int -> List (Attribute msg)
flex n =
    css [ DisplayFlex, Flex <| String.fromInt n ]


cssBtn : List (Attribute msg)
cssBtn =
    css
        [ MarginRight "0.1rem"
        , MarginLeft "0.1rem"
        , BdRadius "3px"
        , Bgcolor Whitesmoke
        , Padding "0.15rem 1rem 0.15rem 1rem"
        , Border "1px"
        ]
