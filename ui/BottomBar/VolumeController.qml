import QtQuick

Item{
    property string fontColor: "#373737"
    height: 30 * (parent.height / 720)
    width: 120 * (parent.width / 1280)

    Connections{
        target: audioController
        function onVolumeLevelChanged(){
        volumeIcon.visible = false
            visibleTimer.stop()
            visibleTimer.start()
    }
    }
    Timer{
        id: visibleTimer
        interval: 500
        repeat: false
        onTriggered: {
            volumeIcon.visible = true
        }
    }

    Rectangle{
        anchors {
            left: decrementButton.left
            right: incrementButton.right
        }
    }
Rectangle{
    id: decrementButton
    anchors {
        right: volumeIcon.left
        rightMargin: 15
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
        MouseArea{
            anchors.fill: parent
            onClicked: audioController.incrementVolume(-1)
        }
    }


}
    Image {
        id: volumeIcon
        height: parent.height * .5
        fillMode: Image.PreserveAspectFit
        anchors {
            right: parent.right
            rightMargin: 200
            verticalCenter: parent.verticalCenter
        }
        source: {
            if(audioController.volumeLevel <=1)
            return "qrc:/ui/assets/muted.png"
            else if(audioController.volumeLevel <=25)
            return "qrc:/ui/assets/volume-down.png"
            else if(audioController.volumeLevel < 50)
                return "qrc:/ui/assets/volume.png"
            else
                return "qrc:/ui/assets/volume-up.png"
    }
    }
    Rectangle{
        id: incrementButton
        anchors {
            left: volumeIcon.right
            leftMargin: 20
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
            MouseArea{
                anchors.fill: parent
                onClicked: audioController.incrementVolume(1)
            }
        }


    }
    Text {
        id: volumeTextLable
        color: "white"
        visible: !volumeIcon.visible
        font.pixelSize: 18
        text: audioController.volumeLevel
        anchors {
            right: parent.right
            rightMargin: 200
            verticalCenter: parent.verticalCenter
        }
    }
}
