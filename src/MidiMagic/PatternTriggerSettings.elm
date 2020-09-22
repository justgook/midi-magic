module MidiMagic.PatternTriggerSettings exposing (view)

import Html exposing (div, span, text)
import Html.Attributes exposing (class)


view aaa =
    div [ class "pattern-trigger-settings" ]
        [ div [] [ text "S", div [] [ text "Solo" ] ]
        , div [] [ text "M", div [] [ text "Mono" ] ]
        , div [] [ text "< Scale Notes >", div [] [ text "Scale" ] ]
        , div [] [ text "< 0 >", div [] [ text "Octave" ] ]
        , div [] [ text "< 1 >", div [] [ text "Channel" ] ]
        , div [] [ text "< 1 >", div [] [ text "Instrument" ] ]
        , div [] [ text "< Off >", div [] [ text "Fixed Notes" ] ]
        , div [] [ text "< 127 >", div [] [ text "Velocity" ] ]
        ]
