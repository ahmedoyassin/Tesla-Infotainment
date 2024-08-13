import QtQuick

import QtLocation
import QtPositioning
import "../Locker"
Rectangle {
    id: rightScreen
    width: parent.width * 2/3
    anchors {
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }
    Plugin {
        id: mapPlugin
        name: "osm"
        PluginParameter {
                name: "osm.mapping.custom.host"

                // OSM plugin will auto-append if .png isn't suffix, and that screws up apikey which silently
                // fails authentication (only Wireshark revealed it)
                value: "http://tile.thunderforest.com/landscape/%z/%x/%y.png?apikey=d55ed3e8da894c29afa2f80e2654f1d7&fake=.png"
            }
        }

        Map {
            id: map
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(29.9602, 31.2569) // Maadi
            zoomLevel: 14
            property geoCoordinate startCentroid
            activeMapType: supportedMapTypes[supportedMapTypes.length - 1]

            PinchHandler {
                id: pinch
                target: null
                onActiveChanged: if (active) {
                    map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
                }
                onScaleChanged: (delta) => {
                    map.zoomLevel += Math.log2(delta)
                    map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                }
                onRotationChanged: (delta) => {
                    map.bearing -= delta
                    map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                }
                grabPermissions: PointerHandler.TakeOverForbidden
            }
            WheelHandler {
                id: wheel
                // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
                // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
                // and we don't yet distinguish mice and trackpads on Wayland either
                acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                                 ? PointerDevice.Mouse | PointerDevice.TouchPad
                                 : PointerDevice.Mouse
                rotationScale: 1/120
                property: "zoomLevel"
            }
            DragHandler {
                id: drag
                target: null
                onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
            }
            Shortcut {
                enabled: map.zoomLevel < map.maximumZoomLevel
                sequence: StandardKey.ZoomIn
                onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
            }
            Shortcut {
                enabled: map.zoomLevel > map.minimumZoomLevel
                sequence: StandardKey.ZoomOut
                onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
            }
        }
        Locker{
            id: lockIcon

        }
        NavigationSearchBox{
            id: navSearchBox
            width: parent.width / 3
            height: parent.height /12
            anchors {
                left: lockIcon.left
                top: lockIcon.bottom
                topMargin: 20
            }
        }

        Text{
            id: dateTimeDisplay
            font.pixelSize: 18
            font.bold: true
            color:"black"
            anchors{
                left: lockIcon.right
                leftMargin: 30
                bottom: lockIcon.bottom
            }
            text: systemHandler.currentTime
        }
        Text{
            id: outdoorTempDisplay
            font.pixelSize: 18
            font.bold: true
            color:"black"
            anchors{
                left: dateTimeDisplay.right
                leftMargin: 30
                bottom: lockIcon.bottom
            }
            text: (systemHandler.outdoorTemp*5/10) + "°C"
        }
        Text{
            id: usernameDisplay
            font.pixelSize: 18
            font.bold: true
            color:"black"
            anchors{
                left: outdoorTempDisplay.right
                leftMargin: 30
                bottom: lockIcon.bottom
            }
            text: systemHandler.userName
        }
    }
