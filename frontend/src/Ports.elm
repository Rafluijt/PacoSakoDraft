port module Ports exposing
    ( logToConsole
    , requestSvgNodeContent
    , responseSvgNodeContent
    , triggerPngDownload
    , websocketReceive
    , websocketSend
    )

{-| Ports module dealing with exporting graphics.
-}

import Json.Encode exposing (Value)


{-| Takes the id of an svg node and returns the serialized xml. As a port function can not
directy return anything, this will return via responseSvgNodeContent.
-}
port requestSvgNodeContent : String -> Cmd msg


{-| Subscription half of requestSvgNodeContent.
-}
port responseSvgNodeContent : (String -> msg) -> Sub msg


{-| Instructs the browser to convert the SVG to a PNG and to start a download.
-}
port triggerPngDownload : Value -> Cmd msg


{-| Port for console.log( .. )
-}
port logToConsole : String -> Cmd msg


{-| Port to send messages to the websocket.

Do no use this port directly, it is wrapped by the Websocket.elm module.

-}
port websocketSend : Value -> Cmd msg


{-| Port to get messages back from the websocket.

Do no use this port directly, it is wrapped by the Websocket.elm module.

-}
port websocketReceive : (Value -> msg) -> Sub msg
