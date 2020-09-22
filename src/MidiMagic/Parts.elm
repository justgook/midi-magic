module MidiMagic.Parts exposing (view)

import Html exposing (button, div, text)
import Html.Attributes exposing (class)


view parts =
    parts
        --|> List.map (.name >> text >> List.singleton >> button [] >> List.singleton >> (::) (text "(+)") >> div [])
        |> List.map itemView
        |> div [ class "song-parts" ]


itemView { name } =
    div []
        [ button [] [ text "+" ]
        , button [] [ text name ]
        , button [ class "remove" ] [ text "x" ]
        , button [] [ text "+" ]
        ]
