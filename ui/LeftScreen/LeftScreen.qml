import QtQuick
import "../Locker"

Rectangle{
    id: leftScreen
    color: "white"
    anchors{
    left: parent.left
    right: rightScreen.left
    bottom: bottomBar.top
    top: parent.top
}
    Image {
        id: carRender
        width: parent.width
        fillMode: Image.PreserveAspectFit
        anchors {
            centerIn: parent
        }
        source: "qrc:/ui/assets/Car.jpg"
    }

}
