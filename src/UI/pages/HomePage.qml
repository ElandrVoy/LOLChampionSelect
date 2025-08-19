// pages/HomePage.qml
import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Page {
    id: homePage
    Material.primary: "#852525"
    Material.background: "#141414"
    Material.accent: "#7c7c7c"
    
    //Champions grid
    Item {
        id: searchResult
        anchors {
            left:  championPanel.right
            top: searchPanel.bottom
            right: parent.right
            bottom: parent.bottom
        }

        Flickable {
            readonly property real calcContentHeight: {
                return Math.ceil(gridChampions.ids.length / gridChampions.calcColumns) * 120 * 1.1
            }
            id: flick
            anchors.fill: parent
            width: parent.width
            height: parent.height
            contentWidth: parent.width
            contentHeight: calcContentHeight
            boundsBehavior: Flickable.StopAtBounds
            bottomMargin: 20

            Frame {
                width: parent.width
                height: parent.calcContentHeight
                background: Rectangle {
                    color: "transparent"
                    border.color: "red"
                    border.width: 0  // Убедитесь, что граница отключена
                }

                Grid {
                    id: gridChampions
                    // anchors.fill: parent
                    width: parent.width
                    height: parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    property real minWidth: 120
        
                    readonly property int calcColumns: {
                        var itemsInRow = width / (minWidth)
                        return Math.max(1, Math.floor(itemsInRow))
                    }
                    
                    columns: calcColumns
                    // spacing: 0
                    // padding: 0
                    leftPadding: ((width - (minWidth * calcColumns)) / 2) - vbar.width
                    property var ids: searchField.searchResultList
                    property var names: []
                    Repeater {
                        id: rep
                        model: gridChampions.ids.length                

                        Frame {
                            width: 120
                            height: width * 1.1
                            id: gridChampionsFrame
                            background: Rectangle {
                                color: "transparent"
                                border.width: 0  // Убедитесь, что граница отключена
                            }

                            required property int index
                            property string imageName: gridChampions.ids[index]
                                
                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 0

                                Image {
                                source: "../../resources/img/" + gridChampionsFrame.imageName + ".png"
                                horizontalAlignment: Qt.AlignHCenter
                                Layout.preferredHeight: 100
                                Layout.preferredWidth: 100
                                }
                                
                                Text {

                                    text: gridChampionsFrame.imageName
                                    color: Material.accent
                                    horizontalAlignment: Text.AlignHCenter
                                    Layout.fillWidth: true
                                    font.pixelSize: 17
                                    minimumPixelSize: 10
                                }
                            }
                        }  
                    }
                }
            }
            

            ScrollBar.vertical: ScrollBar {
                id: vbar
                policy: ScrollBar.AsNeeded // Автоматическое появление
                width: 10
                
                contentItem: Rectangle {
                    color: vbar.pressed ? "#606060" : "#808080"
                    radius: width/2
        
                    // Анимация при наведении
                    opacity: vbar.hovered ? 0.8 : 0.5
                    Behavior on opacity { NumberAnimation { duration: 10 } }
                }
            }
        }
    }

    //searchTab
    Frame {
        id: searchPanel
        height: 50
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: championPanel.right

        background: Rectangle {
            color: "#141414"
            border.color: "#252525"
        }

        Grid {
            id: gridSearch
            rows: 1
            anchors.fill: parent
            anchors.centerIn: parent
            spacing: 5
            padding: 0

            TextField {
                id: searchField
                width: 300
                height: 28
                font.family: "Comic Sans"
                font.pixelSize: 16
                verticalAlignment: TextInput.AlignVCenter
                topPadding: (height - font.pixelSize) / 2 -2  // -2 для точной подгонки
                bottomPadding: topPadding
                leftPadding: 30
                color: "#d3d3d3"
                property list<string> searchResultList: search.id("")
                
                background: Rectangle {
                    color: "#292929"
                    border.color: "#444343"
                    radius: 5
                }

                Image {
                    source: "qrc:/icons/search.svg"
                    sourceSize: Qt.size(32, 32)
                    smooth: true
                    anchors {
                        left: parent.left
                        leftMargin: 5
                        verticalCenter: parent.verticalCenter
                    }
                    width: 20
                    height: 20
                    opacity: 0.6
                }
                onTextChanged: {
                    searchResultList = search.id(text)
                }
                onAccepted: {
                    focus = false
                }
            }

            Image {
                source: "qrc:/icons/placeholder.svg"
                sourceSize: Qt.size(32, 32)
                smooth: true
                width: 28
                height: 28
            }
        
        }
    }

    // Left pannel
    Frame {
        id: championPanel
        width: parent.width / 3
        height: parent.height + 2
        anchors.left: parent.left
        background: Rectangle {
            color: "#141414"
            border.color: "#252525"
        }
        
        Image {
            anchors.centerIn: parent
            source: "../../resources/img/Aatrox_0.jpg"    
        }
    }
    
}