module MidiMagic.Model exposing (Message(..), Model, PatternItem(..), empty)


type alias Model =
    { channels : List Channel
    , parts : List SongPart
    , tempo : Int
    , length : Int
    , baseNote : Int
    , swing : Int
    }


type alias SongPart =
    { name : String
    }


type alias Channel =
    { pattern : List PatternItem
    , name : String
    , selected : Bool
    , muted : Bool
    }


type Message
    = PattenEditorReset Int
    | PattenEditorIncrease Int
    | PattenEditorDecrease Int
    | PattenEditorOct Int
    | SetTempo Int
    | SetLength Int
    | SetBaseNote Int
    | SetSwing Int


type PatternItem
    = Stop
    | Continue
    | Play Int


empty : Model
empty =
    { parts = [ { name = "First Part" } ]
    , tempo = 120
    , length = 1
    , baseNote = 2
    , swing = 0
    , channels =
        [ { pattern = [ Stop, Continue, Play 0 ]
          , name = "Channel: 1"
          , selected = True
          , muted = False
          }
        , { pattern = []
          , name = "Channel: 2"
          , selected = False
          , muted = False
          }
        ]
    }
