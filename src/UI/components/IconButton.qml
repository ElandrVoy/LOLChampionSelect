// IconButton.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: iconButton
    property string iconSource: "qrc:/icons/placeholder.svg"
    property string text: ""
    property bool checked: false
    width: 40
    height: 40
    signal clicked
    property color iconColor: iconButton.checked ? "#4CAF50" : "#e40707ff"


    Rectangle {
        id: backgroundRect
        color: "transparent"
        radius: parent.width / 2
        anchors.fill: parent
        border.color: iconButton.checked ? "#4CAF50" : "transparent"
        border.width: 0
    }


    Image {
        id: image
        source: iconButton.iconSource
        sourceSize: Qt.size(iconButton.height / 4 * 3, iconButton.width / 4 * 3)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        y: 0
        smooth: true
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: iconButton.clicked()
        hoverEnabled: true
        onEntered: backgroundRect.color = "#525252"
        onExited: backgroundRect.color = "transparent"
    }
    
}