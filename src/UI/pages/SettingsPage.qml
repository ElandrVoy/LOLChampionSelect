// pages/SettingsPage.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    id: settingsPage

    background: Rectangle {
        color: "transparent"
    }
    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "Настройки"
            color: "white"
            font.bold: true
            font.pointSize: 18
        }

        Switch {
            text: "Тёмная тема"
            checked: true
        }

        Button {
            text: "Сохранить"
            onClicked: console.log("Сохранено")
        }
    }

}