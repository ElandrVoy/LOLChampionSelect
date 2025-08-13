// pages/HomePage.qml
import QtQuick 2.15
import QtQuick.Controls 2.15


Page {
    id: homePage
    property string pageTitle: "Страница"
    
    Component.onCompleted: {
        console.log("HomePage loaded, size:", width, "x", height)
    }

    Rectangle {
        anchors.fill: parent
        color: "red"
        radius: 8
    }

    Text {
        anchors.centerIn: parent
        text: "TEST"
        color: "white"
        font.bold: true
        font.pointSize: 18
    }
}