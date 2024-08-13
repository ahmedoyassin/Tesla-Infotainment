import QtQuick

Rectangle {
    id: navSearchBox
    radius: 5
    color:"#f0f0f0"
    Image{
        id: searchIcon
        source: "qrc:/ui/assets/searchimg.png"
        height: parent.height * .45
        fillMode: Image.PreserveAspectFit
        anchors {
            left: parent.left
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }
    }
    Text {
        id: navPlaceHolderText
        visible: navTextInput.text === ""
        color: "#373737"
        text: "Navigate"
        anchors{
            verticalCenter: parent.verticalCenter
            left: searchIcon.right
            leftMargin: 20
        }
    }
    TextInput{
        id: navTextInput
        clip: true
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: navPlaceHolderText.left
            leftMargin: 20
        }
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 16
    }
}
