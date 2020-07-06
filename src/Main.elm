module Main exposing (..)

import Browser
import FirstUniqueLetter exposing (firstUniqueLetter)
import Html exposing (Html, div, input, label, strong, text)
import Html.Attributes exposing (class, for, id, type_)
import Html.Events exposing (onInput)



---- MODEL ----


type alias Model =
    { word : Maybe String
    , firstUnique : Maybe Char
    }


init : ( Model, Cmd Msg )
init =
    ( { word = Nothing
      , firstUnique = Nothing
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = Update String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Update word ->
            ( { model | word = Just word, firstUnique = firstUniqueLetter word }, Cmd.none )



---- VIEW ----


viewFirstUnique : Model -> Html Msg
viewFirstUnique model =
    case model.firstUnique of
        Just a ->
            div [ class "alert alert-success" ]
                [ strong [] [ text "Found! " ]
                , text "First unique letter is "
                , strong [] [ text (String.fromChar a) ]
                ]

        Nothing ->
            div [ class "alert alert-danger" ]
                [ strong [] [ text "Not Found! " ]
                , text "Unable to find a unique letter in the word"
                ]


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ div [ class "jumbotron" ]
            [ Html.form [ class "form-inline" ]
                [ div [ class "form-group" ]
                    [ label [ for "input" ] [ text "Input String:" ]
                    , input [ type_ "text", onInput Update, class "form-control", id "input" ] []
                    , viewFirstUnique model
                    ]
                ]
            ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
