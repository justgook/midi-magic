module MidiMagic.Instruments exposing (view)

import Html exposing (button, div, section, text)
import Html.Attributes exposing (class)


view channels =
    channels
        |> List.map (.name >> text >> List.singleton >> button [])
        |> section [ class "instruments" ]
