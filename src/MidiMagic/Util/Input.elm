module MidiMagic.Util.Input exposing (number, numberOptions, numberWith)

import Html exposing (div, span, text)
import Html.Attributes exposing (attribute, class)
import MidiMagic.Util.Icon as Icon


dataLabel : String -> Html.Attribute msg
dataLabel =
    attribute "data-label"


type alias NumberOptions =
    { min : Int
    , max : Int
    , step : Int
    , toString : Int -> String
    }


numberOptions : NumberOptions
numberOptions =
    { max = 540
    , min = 1
    , step = 1
    , toString = String.fromInt
    }


number : (Int -> msg) -> String -> Int -> Html.Html msg
number msg tt i =
    numberWith numberOptions msg tt i


numberWith : NumberOptions -> (Int -> msg) -> String -> Int -> Html.Html msg
numberWith opt msg tt i =
    div [ class "number-with", dataLabel tt ]
        [ Icon.previous (msg (i - 1)), text (opt.toString i), Icon.next (msg (i + 1)) ]
