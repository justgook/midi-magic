module MidiMagic.MainMenu exposing (view)

import Array
import Html exposing (div, label, span, text)
import Html.Attributes exposing (class)
import MidiMagic.Model exposing (Message(..))
import MidiMagic.Util.Icon as Icon
import MidiMagic.Util.Input as Input exposing (number, numberOptions, numberWith)


view { tempo, length, baseNote, swing } =
    [ number SetTempo "Tempo" tempo
    , numberWith swingOptions SetSwing "Swing" swing
    , div [] [ Icon.note, div [] [ text "Chords" ] ]
    , numberWith lengthOpt SetLength "Length" length
    , numberWith noteOptions SetBaseNote "Base note" baseNote
    , div [] [ text "! Major ^", span [] [ text "Scale" ] ]
    ]
        |> div [ class "main-menu" ]


lengthOpt =
    { numberOptions
        | toString = numberOptions.toString >> String.append "Bar "
    }


noteOptions =
    { numberOptions
        | toString = \i -> Array.get i notes |> Maybe.withDefault "C"
    }


swingOptions =
    { numberOptions
        | toString = \i -> Array.get i swingValues |> Maybe.withDefault "Off"
    }


swingValues =
    [ "Off", "54%", "58%", "62%", "67%", "70%", "75%", "79%", "83%", "87%", "92%" ]
        |> Array.fromList


notes =
    [ "C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B" ]
        |> Array.fromList
