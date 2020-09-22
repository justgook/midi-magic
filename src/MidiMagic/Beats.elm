module MidiMagic.Beats exposing (view)

import Html exposing (div, li, text, ul)
import Html.Attributes exposing (class)


view bars =
    List.repeat (bars * 16) (li [] [])
        |> ul [ class "beats" ]
