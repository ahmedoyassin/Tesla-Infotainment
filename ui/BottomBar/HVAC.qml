import QtQuick

Item{
    property string fontColor: "#373737"
    property var hvacController
    width: 55 * (parent.width / 1280)

    Rectangle{
        anchors {
            left: decrementButton.left
            right: incrementButton.right
        }
    }

Rectangle{
    id: decrementButton
    width: height / 2
    color: "black"
    anchors {
        left: parent.left
        top: parent.top
        bottom: parent.bottom

    }
    Text{
        id: decrementText
        color: fontColor
        anchors {
            centerIn: parent
        }
        text: "<"
        font.pixelSize: 18
    }
    MouseArea{
        anchors.fill: parent
        onClicked: hvacController.incrementTargetTemp(-1)
    }

}
    Text {
        id: targetTempText
        color: fontColor
        anchors {
            left: decrementButton.right
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }
        font.pixelSize: 24
        text: hvacController.targetTemp
    }
    Rectangle{
        id: incrementButton
        width: height / 2
        color: "black"
        anchors {
            left: targetTempText.left
            leftMargin: 40
            top: parent.top
            bottom: parent.bottom

        }
        Text{
            id: inccrementText
            color: fontColor
            anchors {
                centerIn: parent
            }
            text: ">"
            font.pixelSize: 18
        }
        MouseArea{
            anchors.fill: parent
            onClicked: hvacController.incrementTargetTemp(1)
        }

    }
}
