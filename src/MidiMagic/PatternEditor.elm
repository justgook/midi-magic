module MidiMagic.PatternEditor exposing (view)

import Html exposing (div, section, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import MidiMagic.Model exposing (Message(..), PatternItem(..))


reset cc i =
    div
        [ class cc
        , onClick (PattenEditorReset i)
        ]


active : Int -> Int -> List (Html.Html Message)
active i tone =
    [ span [ class "pattern-editor-item-counter" ] []
    , div [ class "pattern-editor-item", class "inc", onClick (PattenEditorIncrease i) ] [ text "+" ]
    , reset "pattern-editor-item active"
        i
        [ if tone > 0 then
            text "+"

          else
            text ""
        , text (String.fromInt tone)
        ]
    , div [ class "pattern-editor-item", class "inc", onClick (PattenEditorDecrease i) ] [ text "-" ]
    , div [ class "pattern-editor-item", onClick (PattenEditorOct i) ] [ text "Oct" ]
    , div [ class "pattern-editor-item", class "scale" ] []
    ]


continue : Int -> List (Html.Html Message)
continue i =
    [ span [ class "pattern-editor-item-counter" ] []
    , reset "pattern-editor-item2" i [ text "-" ]
    ]


stop : Int -> List (Html.Html Message)
stop i =
    [ span [ class "pattern-editor-item-counter" ] []
    , reset "pattern-editor-item2 active" i [ text "#" ]
    ]


view =
    List.indexedMap
        (\i item ->
            case item of
                Stop ->
                    stop i

                Continue ->
                    continue i

                Play tone ->
                    active i tone
        )
        >> List.concat
        >> div [ class "pattern-editor-grid" ]
        >> List.singleton
        >> section [ class "pattern-editor" ]
