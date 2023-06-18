import QtQuick 2.15
import QtQuick.Controls 2.15
import QtLocation 5.15
import QtPositioning 5.15

Item {
    id: rootId

    property bool gpstrack: true
    property int mapType: 0
    property var maptypes: ["Map View", "Satellite View", "Terrain View", "Hybrid View"]

    PositionSource {
        id: gpsSource
        updateInterval: 1000
        active: gpstrack
    }

    Map {
        id: mapBase
        plugin: GoogleMapPlugin{}
        anchors.fill: parent
        zoomLevel: 2
        center: QtPositioning.coordinate(0,0,0)
        activeMapType: supportedMapTypes[mapType]
        // onCenterChanged: console.log('gps position:', center.latitude, center.longitude)
    }

    Map {
        id: mapOverlay
        anchors.fill: parent
        plugin: Plugin { name: "itemsoverlay" }
        gesture.enabled: false
        center: mapBase.center
        color: 'transparent' // Necessary to make this map transparent
        minimumFieldOfView: mapBase.minimumFieldOfView
        maximumFieldOfView: mapBase.maximumFieldOfView
        minimumTilt: mapBase.minimumTilt
        maximumTilt: mapBase.maximumTilt
        minimumZoomLevel: mapBase.minimumZoomLevel
        maximumZoomLevel: mapBase.maximumZoomLevel
        zoomLevel: mapBase.zoomLevel
        tilt: mapBase.tilt;
        bearing: mapBase.bearing
        fieldOfView: mapBase.fieldOfView
        z: mapBase.z + 2

        MapQuickItem
        {
            id:homeLatLong
            anchorPoint.x: width/2
            anchorPoint.y: height/2
            coordinate: mapBase.center
            sourceItem: Image {
                width: 32
                height: 32
                source: "qrc:/icon/homemarker.png"
            }
        }
    }

    Item {
        id: overlayId
        anchors.fill: parent
        anchors.margins: 20

        ComboBox {
            model: maptypes
            anchors.right: parent.right
            onCurrentIndexChanged: {
                mapType = currentIndex
            }
        }

        Column {
            spacing: 10
            anchors {
                right: parent.right
                bottom: parent.bottom
            }
            Row {
                spacing: 10
                CButtonImage {
                    source: "qrc:/icon/fitview.png"
                    onClicked: fitMapView()
                }
                CButtonImage {
                    source: "qrc:/icon/location.png"
                    color: gpstrack ? "#7a7a7a" : "#C0C0C0"
                    onClicked: {
                        gpstrack = !gpstrack
                        mapBase.center = gpsSource.position.coordinate;
                    }
                }
            }
            Row {
                spacing: 10
                CButton {
                    text: "+"
                    onClicked: {
                        mapBase.zoomLevel = mapBase.zoomLevel + 1
                    }
                }
                CButton {
                    text: "-"
                    onClicked: {
                        mapBase.zoomLevel = mapBase.zoomLevel - 1
                    }
                }
            }
        }
    }

    function fitMapView() {
        // workaround for fit view
        mapBase.zoomLevel = 19
        mapBase.fitViewportToMapItems(mapOverlay.mapItems)
    }

}
