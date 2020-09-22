module MidiMagic.PatternSetting exposing (view)

import Html exposing (div, input, text)
import Html.Attributes exposing (class, type_)


view aaa =
    div [ class "pattern-settings" ]
        [ div [] [ text "< Custom >", div [] [ text "Pattern" ] ]
        , div [] [ text "< 1 >", div [] [ text "Length" ] ]
        , div [] [ text "Save" ]
        , div [] [ input [ type_ "checkbox" ] [], div [] [ text "Use triplets" ] ]
        , div [] [ input [ type_ "checkbox" ] [], div [] [ text "Double Tempo" ] ]
        ]
