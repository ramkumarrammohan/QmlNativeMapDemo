import QtQuick 2.15
import QtLocation 5.15

Plugin{
    id: mapPlugin
    name: "googlemaps"

    PluginParameter {
        name: "googlemaps.apikey"
        value: mapsKey ? mapsKey.apiKey : ""
    }
}

