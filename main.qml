import QtQuick
import QtQuick.Window
import QtQuick.VirtualKeyboard
import "ui/BottomBar"
import "ui/RightScreen"
import "ui/LeftScreen"
Window {
    id: window
    width: 1280
    height: 720
    visible: true
    title: qsTr("Tesla Infotainment")
    LeftScreen{
        id: leftScren
    }

    RightScreen{
        id: rightScreen
    }

    BottomBar {
        id: bottomBar
    }

}
