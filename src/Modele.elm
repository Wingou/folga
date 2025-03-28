module Modele exposing (..)

import Http


type alias Model =
    { elements : List Element
    , error : Maybe Http.Error
    , input : Input
    }

type alias Input = {
                sourcePath : String
                , destPath : String
                    }

type alias Elements = List Element

type alias Element =
            {     id : Id
                , name : Name
                , path : Path
                , dateCreate : DateCreat
                , class : Class

                }


type   Class = 
    FOLDER IsParent 
    | IMAGE Size
    | VIDEO Size
    | UNKNOWN
    

type alias Id = Int

type alias Name = String

type alias Path = String

type alias Size = Int

type alias DateCreat = String


type alias IsParent = Bool

type Msg
    = SetSourcePath String
    | SetDestPath String


initialModel : Model
initialModel =
    { error = Nothing
    , elements = []
    , input = {sourcePath = "", destPath=""}
    }
