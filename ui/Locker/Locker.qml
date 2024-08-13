import QtQuick

Image {
    id:lockIcon
    width: parent.width / 45
    fillMode: Image.PreserveAspectFit
    anchors{
        left: parent.left
        top: parent.top
        margins: 10
    }
    source: ( systemHandler.carLocked ? "qrc:/ui/assets/padlock.png" : "qrc:/ui/assets/padlock-unlock.png" )
    MouseArea{
        anchors.fill: parent
        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
        onClicked: systemHandler.setCarLocked( !systemHandler.carLocked )
    }
}
