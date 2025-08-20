// ChampionItem.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material 2.15

Frame {
    id: gridChampionsFrame
    width: 120
    height: width * 1.1
    
    required property int index
    property string imageName: ""
    property bool isHovered: false

    background: Rectangle {

        color: gridChampionsFrame.isHovered ? "#6e6e6e" : "transparent"
        anchors.fill: parent
        anchors.bottomMargin:-5
        anchors.topMargin: 5
        anchors.leftMargin: textName.implicitWidth > 100 ? -5 : 3
        anchors.rightMargin: textName.implicitWidth > 100 ? -5 : 3
        border.width: 0
        radius: 8  // Закругленные углы
        Behavior on color { ColorAnimation { duration: 150 } }  // Плавный переход
    } 

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: gridChampionsFrame.isHovered = true
        onExited: gridChampionsFrame.isHovered = false
        onClicked: {
            // Обработка клика
            console.log("Clicked on:", gridChampionsFrame.imageName)
            console.log("Text width:", textName.implicitWidth)
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        property bool excluded: false
        
        Image {
        source: "../../resources/img/" + gridChampionsFrame.imageName + ".png"
        horizontalAlignment: Qt.AlignHCenter
        Layout.preferredHeight: 100
        Layout.preferredWidth: 100
        Layout.fillWidth: true
        }
        
        Text {
            id: textName
            text: backend.name(gridChampionsFrame.imageName)
            color: gridChampionsFrame.isHovered ? "#d6d6d6" : Material.accent
            Behavior on color { ColorAnimation { duration: 150 } }
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            font.pixelSize: 16
            minimumPixelSize: 10
        }
    }
}