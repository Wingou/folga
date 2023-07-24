module Server exposing (..)

-- import Config exposing (..)
-- import Html exposing (..)
-- import Http
-- import Json.Decode as Json exposing (Decoder)
-- import Json.Decode.Extra as JsonE
-- import Json.Encode as Encode
-- import Modele exposing (..)


-- priceDecoder : Decoder Price
-- priceDecoder =
--     Json.succeed Price
--         |> JsonE.andMap (Json.field "pId" Json.int)
--         |> JsonE.andMap (Json.field "pPrix" Json.float)
--         |> JsonE.andMap (Json.field "pComment" (Json.maybe Json.string))
--         |> JsonE.andMap (Json.field "pDateAction" Json.string)
--         |> JsonE.andMap (Json.field "pObjet" lieuDecoder)
--         |> JsonE.andMap (Json.field "pDateModif" Json.string)
--         |> JsonE.andMap (Json.field "pTemplate" Json.int)


-- lieuDecoder : Decoder Lieu
-- lieuDecoder =
--     Json.succeed Lieu
--         |> JsonE.andMap (Json.field "oId" Json.int)
--         |> JsonE.andMap (Json.field "oObjet" Json.string)
--         |> JsonE.andMap (Json.field "oCat" catDecoder)
--         |> JsonE.andMap (Json.field "oDateModif" Json.string)
--         |> JsonE.andMap (Json.field "oTemplate" Json.int)


-- catDecoder : Decoder Cat
-- catDecoder =
--     Json.succeed Cat
--         |> JsonE.andMap (Json.field "cId" Json.int)
--         |> JsonE.andMap (Json.field "cCat" Json.string)
--         |> JsonE.andMap (Json.field "cOrdre" Json.int)
--         |> JsonE.andMap (Json.field "cOrdreOrigine" Json.int)
--         |> JsonE.andMap (Json.field "cDateModif" Json.string)
--         |> JsonE.andMap (Json.field "cTemplate" Json.int)


-- encodeM : String -> Maybe String -> ( String, Encode.Value )
-- encodeM str v =
--     case v of
--         Just v_ ->
--             ( str, Encode.string v_ )

--         Nothing ->
--             ( str, Encode.null )


-- encodedPrice : Price -> Encode.Value
-- encodedPrice p =
--     Encode.object
--         [ ( "pId", Encode.int p.id )
--         , ( "pPrix", Encode.float p.montant )
--         , encodeM "pComment" p.comment
--         , ( "pDateAction", Encode.string p.dateAction )
--         , ( "pObjet", encodedLieu p.lieu )
--         , ( "pDateModif", Encode.string p.dateModif )
--         , ( "pTemplate", Encode.int p.template )
--         ]


-- encodedLieu : Lieu -> Encode.Value
-- encodedLieu lieu =
--     Encode.object
--         [ ( "oId", Encode.int lieu.id )
--         , ( "oObjet", Encode.string lieu.nom )
--         , ( "oCat", encodedCat lieu.cat )
--         , ( "oDateModif", Encode.string lieu.dateModif )
--         , ( "oTemplate", Encode.int lieu.template )
--         ]


-- encodedCat : Cat -> Encode.Value
-- encodedCat cat =
--     Encode.object
--         [ ( "cId", Encode.int cat.id )
--         , ( "cCat", Encode.string cat.nom )
--         , ( "cOrdre", Encode.int cat.pos )
--         , ( "cOrdreOrigine", Encode.int cat.posDefault )
--         , ( "cDateModif", Encode.string cat.dateModif )
--         , ( "cTemplate", Encode.int cat.template )
--         ]


-- apiDataDecoder : Decoder Prices
-- apiDataDecoder =
--     Json.list priceDecoder


-- fetchData : Cmd Msg
-- fetchData =
--     Http.get
--         { url = apiPath ++ "/prices"
--         , expect = Http.expectJson FetchData apiDataDecoder
--         }



fetchData : String
fetchData = "Fetching"

