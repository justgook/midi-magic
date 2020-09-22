module MidiMagic.Util.Icon exposing (next, note, previous)

import Html exposing (i, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


next click =
    i [ class "icon-next", onClick click ] []


previous click =
    i [ class "icon-previous", onClick click ] []


note =
    i [ class "icon-note" ] []
