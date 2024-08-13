import QtQuick

Rectangle{
    id: bottomBar
    color: "black"
    height: parent.height / 12
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    Image {
        id: carSettingsIcon
        height: parent.height * .75
        fillMode: Image.PreserveAspectFit
        anchors{
            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        source: "qrc:/ui/assets/frontcar.png"
    }
    HVAC{
        id: driverHVACControl
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: carSettingsIcon.right
            leftMargin: 150
        }
        hvacController: driverHVAC
    }
    HVAC{
        id: passangerHVACControl
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            rightMargin: 450
        }
        hvacController: passangerHVAC
    }
    VolumeController{
        id: volumeControl
            anchors{
                right: parent.right
                rightMargin: 20
                top: parent.top
                bottom: parent.bottom
            }
        }
}
