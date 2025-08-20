import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "components"

ApplicationWindow {
    id: window
    width: 1200
    height: 800
    visible: true
    title: "LOLChamp"
    
    // === Настройка Material-стиля ===
    Material.background: "#181818"
    Material.accent: "#153010"
    Material.primary: "#166d07"

    font.family: "Open Sans"
    font.pixelSize: 14

    // === Контентная область ===
    StackView {
        id: stackView
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: leftPanel.right
        initialItem: "pages/HomePage.qml"
        }

    // === Левая панель (иконки) ===
    Frame {
        id: leftPanel
        width: 50
        padding: 0
        spacing: 0
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: parent.top

        background: Rectangle {
            color: "#1b1b1b"
            border.color: "#333"
        }

        ColumnLayout {
            anchors.fill: parent
            spacing: 0
            anchors.margins: 0
            anchors.topMargin: 0

            IconButton {
                iconSource: "qrc:/icons/home.svg"
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 40
                Layout.preferredWidth: 40
                Layout.fillWidth: false
                onClicked: stackView.push("pages/HomePage.qml")
            }
        
            // Другие иконки будут добавлены сюда
            IconButton {
                
                iconSource: "qrc:/icons/placeholder.svg"  // можно использовать SVG или PNG
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 40
                Layout.preferredWidth: 40
                Layout.fillWidth: false
            }

            
            Item {
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter
            }
            
            // Настройки
            IconButton {
                iconSource: "qrc:/icons/settings.svg"
                onClicked: stackView.push("pages/SettingsPage.qml")
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 40
                Layout.preferredWidth: 40
                Layout.fillWidth: false
            }

            // Выход
            IconButton {
                iconSource: "qrc:/icons/shutdown.svg"
                onClicked: Qt.quit()
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 40
                Layout.preferredWidth: 40
                Layout.fillWidth: false
            }
        }
    }
       
    
}