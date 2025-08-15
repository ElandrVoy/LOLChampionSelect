// pages/SettingsPage.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
Page {
    id: settingsPage

    Material.primary: "#141414"
    Material.background: "#141414"
    Material.accent: "#193d10"
    
    Frame {
        background: Rectangle {
            color: "transparent"
            border {
                color: "#4b4b4b"
            }
            radius: 5
        }

        id: settingsPageRectangle
        anchors.centerIn: parent
        width: parent.width / 3 * 2
        height: parent.height / 3 * 2
    }

}