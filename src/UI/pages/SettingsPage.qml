// pages/SettingsPage.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: settingsPage
    anchors.fill: parent

    Column {
        anchors.fill: parent
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