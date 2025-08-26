// IconButton.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: filterButton
    property string iconSource: "qrc:/icons/placeholder.svg"
    property string tag: ""
    property bool checked: false
    width: 40
    height: 40
    signal clicked
    
    Rectangle {
        id: backgroundRect
        color: "transparent"
        radius: parent.width / 2
        anchors.fill: parent
        border.width: 0
    }

    Image {
        id: image
        source: filterButton.iconSource
        sourceSize: Qt.size(filterButton.height / 4 * 3, filterButton.width / 4 * 3)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        y: 0
        smooth: true
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: filterButton.clicked()
        hoverEnabled: true
        onEntered: backgroundRect.color = "#525252"
        onExited: backgroundRect.color = "transparent"
    }

    Popup {
        id: tooltip
        modal: false
        focus: false
        x: image.x - (width / 2) + (image.width / 2)
        y: image.y - image.height + 6 // над элементом
        padding: 0

        background: Rectangle {
            color: "black"
            radius: 4
        }

        Label {
            id: popupLabel
            text: filterButton.tag
            color: "white"
            font.pixelSize: 11
            smooth: true
            padding: 4
            topPadding: 2
            bottomPadding: 2
        }

        // Показываем/скрываем по hover
        visible: mouseArea.containsMouse
        opacity: visible ? 1 : 0
        Behavior on opacity {
            NumberAnimation { duration: 100 }
        }
    }
    
}