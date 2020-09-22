module Main exposing (main)

import Browser exposing (Document)
import Html exposing (div, text)
import Html.Attributes exposing (class)
import MidiMagic.Beats as Beats
import MidiMagic.Instruments as Instruments
import MidiMagic.MainMenu as MainMenu
import MidiMagic.Model as Model exposing (Message(..), Model, PatternItem(..))
import MidiMagic.Parts as Parts
import MidiMagic.PatternEditor as PatternEditor
import MidiMagic.PatternSetting as PatternSetting
import MidiMagic.PatternTriggerSettings as PatternTriggerSettings


main : Program Flags Model Message
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Flags =
    ()


init : Flags -> ( Model, Cmd msg )
init flags =
    ( Model.empty, Cmd.none )


view : Model -> Document Message
view model =
    { title = ""
    , body =
        [ Parts.view model.parts
        , Beats.view model.length
        , MainMenu.view model
        , Instruments.view model.channels
        , div [ class "pattern-trigger" ] [ text "pattern-trigger" ]
        , PatternEditor.view (getSelected model.channels)
        , PatternSetting.view (getSelected model.channels)
        , PatternTriggerSettings.view (getSelected model.channels)
        ]
    }


update : Message -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        SetSwing i ->
            ( { model | swing = i }, Cmd.none )

        SetTempo i ->
            ( { model | tempo = i }, Cmd.none )

        SetLength i ->
            ( { model | length = i }, Cmd.none )

        SetBaseNote i ->
            ( { model | baseNote = i }, Cmd.none )

        PattenEditorReset i ->
            let
                newModel =
                    (\item_ ->
                        case item_ of
                            Stop ->
                                Continue

                            Continue ->
                                Play 0

                            Play _ ->
                                Stop
                    )
                        |> updatePattern model i
            in
            ( newModel, Cmd.none )

        PattenEditorIncrease i ->
            ( (\item ->
                case item of
                    Play tone ->
                        Play (min 24 (tone + 1))

                    _ ->
                        item
              )
                |> updatePattern model i
            , Cmd.none
            )

        PattenEditorDecrease i ->
            ( (\item ->
                case item of
                    Play tone ->
                        Play (max -24 (tone - 1))

                    _ ->
                        item
              )
                |> updatePattern model i
            , Cmd.none
            )

        PattenEditorOct i ->
            ( model, Cmd.none )


updateChannels model fn =
    let
        channels =
            model.channels
                |> List.map
                    (\item ->
                        if item.selected then
                            fn item

                        else
                            item
                    )
    in
    { model | channels = channels }


updatePattern model i fn =
    updateChannels model
        (\item ->
            { item
                | pattern =
                    item.pattern
                        |> List.indexedMap
                            (\i_ item_ ->
                                if i_ == i then
                                    fn item_

                                else
                                    item_
                            )
            }
        )


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none


getSelected channels =
    case channels of
        [] ->
            []

        x :: xs ->
            if x.selected then
                x.pattern

            else
                getSelected xs
