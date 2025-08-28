// HomePage.qml
import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "../components"

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

                        ChampionItem {
                            imageName: gridChampions.ids[index]
                            
                            Component.onCompleted: {
                                appearAnim.start();
                            }

                            ParallelAnimation {
                                id: appearAnim
                                NumberAnimation {
                                    target: parent
                                    property: "opacity"
                                    from: 0; to: 1
                                    duration: 600
                                    easing.type: Easing.OutQuad

                                    Component.onCompleted: {
                                        appearAnim.start();
                                    }
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
    
    //Filter panel
    Rectangle {
        id: filterPanel
        width: 37 * 11 + 4
        height: 40
        color: "#141414"
        border.color: "#252525"
        bottomLeftRadius: 10
        bottomRightRadius: 10
        x: (parent.width * 2 / 3) - (width / 2)
        y: isOpen ? 49 : 0
        property bool isOpen: false
        
        Behavior on y {
            NumberAnimation { duration: 300; easing.type: Easing.OutCubic }
        }

        Row {
            id: filterPanelRow
            anchors.centerIn: parent

            function clickHandler(role, state) {
                state ? backend.del_filter(role) : backend.add_filter(role) 
                state = !state
                searchField.searchResultList = backend.id(searchField.text)
                filteredChamps.text = backend.get_number_of_sorted()
                return state
            }
            
            //Top
            FilterButton {
                id: topButton
                smooth: true
                width: 37
                height: 37
                opacity: isPressed ? 1 : 0.5
                anchors.verticalCenter: parent.verticalCenter
                property bool isPressed: false
                tag: "Top"
                onClicked: isPressed = filterPanelRow.clickHandler(tag, isPressed)                
            }

            //Jungle
            FilterButton {
                id: jgButton
                smooth: true
                width: 37
                height: 37
                opacity: isPressed ? 1 : 0.5
                anchors.verticalCenter: parent.verticalCenter
                property bool isPressed: false
                tag: "Jungle"
                onClicked: isPressed = filterPanelRow.clickHandler(tag, isPressed)
            }

            //Mid
            FilterButton {
                id: midButton
                smooth: true
                width: 37
                height: 37
                opacity: isPressed ? 1 : 0.5
                anchors.verticalCenter: parent.verticalCenter
                property bool isPressed: false
                tag: "Mid"
                onClicked: isPressed = filterPanelRow.clickHandler(tag, isPressed)
            }
            
            //Adc
            FilterButton {
                id: adcButton
                smooth: true
                width: 37
                height: 37
                opacity: isPressed ? 1 : 0.5
                anchors.verticalCenter: parent.verticalCenter
                property bool isPressed: false
                tag: "Adc"
                onClicked: isPressed = filterPanelRow.clickHandler(tag, isPressed)
            }

            //Support
            FilterButton {
                id: supButton
                smooth: true
                width: 37
                height: 37
                opacity: isPressed ? 1 : 0.5
                anchors.verticalCenter: parent.verticalCenter
                property bool isPressed: false
                tag: "Support"
                onClicked: isPressed = filterPanelRow.clickHandler(tag, isPressed)
            }

            //Mage
            FilterButton {
                id: mageButton
                smooth: true
                width: 37
                height: 37
                opacity: isPressed ? 1 : 0.5
                anchors.verticalCenter: parent.verticalCenter
                property bool isPressed: false
                tag: "Mage"
                onClicked: isPressed = filterPanelRow.clickHandler(tag, isPressed)
            }

            //Assasin
            FilterButton {
                id: assasinButton
                smooth: true
                width: 37
                height: 37
                opacity: isPressed ? 1 : 0.5
                anchors.verticalCenter: parent.verticalCenter
                property bool isPressed: false
                tag: "Assasin"
                onClicked: isPressed = filterPanelRow.clickHandler(tag, isPressed)
            }

            //Tank
            FilterButton {
                id: tankButton
                smooth: true
                width: 37
                height: 37
                opacity: isPressed ? 1 : 0.5
                anchors.verticalCenter: parent.verticalCenter
                property bool isPressed: false
                tag: "Tank"
                onClicked: isPressed = filterPanelRow.clickHandler(tag, isPressed)
            }

            //Fighter
            FilterButton {
                id: fighterButton
                smooth: true
                width: 37
                height: 37
                opacity: isPressed ? 1 : 0.5
                anchors.verticalCenter: parent.verticalCenter
                property bool isPressed: false
                tag: "Fighter"
                onClicked: isPressed = filterPanelRow.clickHandler(tag, isPressed)
            }

            //Marksman
            FilterButton {
                id: marksmanButton
                smooth: true
                width: 37
                height: 37
                opacity: isPressed ? 1 : 0.5
                anchors.verticalCenter: parent.verticalCenter
                property bool isPressed: false
                tag: "Marksman"
                onClicked: isPressed = filterPanelRow.clickHandler(tag, isPressed)
            }

            //Clear filters
            FilterButton {
                id: clearButton
                smooth: true
                width: 37
                height: 37
                anchors.verticalCenter: parent.verticalCenter
                tag: "Clear filters"
                onClicked: { 
                    backend.del_filter("all")
                    searchField.searchResultList = backend.id(searchField.text)
                    filteredChamps.text = backend.get_number_of_sorted()
                    topButton.isPressed = false
                    midButton.isPressed = false
                    adcButton.isPressed = false
                    supButton.isPressed = false
                    jgButton.isPressed = false
                    mageButton.isPressed = false
                    tankButton.isPressed = false
                    fighterButton.isPressed = false
                    marksmanButton.isPressed = false
                    assasinButton.isPressed = false

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

        Row {
            id: gridSearch
            anchors.fill: parent
            anchors.centerIn: parent
            spacing: 5
            padding: 0

            TextField {
                id: searchField
                width: 280
                height: 28
                font.family: "Comic Sans"
                font.pixelSize: 16
                verticalAlignment: TextInput.AlignVCenter
                topPadding: (height - font.pixelSize) / 2 -2
                bottomPadding: topPadding
                leftPadding: 30
                color: "#d3d3d3"
                property list<string> searchResultList: backend.id("")
                
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

                Text {
                    id: filteredChamps
                    width: 50
                    text: backend.get_number_of_sorted()
                    color: "#d6d6d6"
                    anchors {
                        left: parent.right
                        leftMargin: -58
                        verticalCenter: parent.verticalCenter
                    }
                    horizontalAlignment: Text.AlignRight
                    font.pixelSize: 12
                    minimumPixelSize: 10
                }

                onTextChanged: {
                    searchResultList = backend.id(text)
                    filteredChamps.text = backend.get_number_of_sorted()
                }

                onAccepted: {
                    focus = false
                }
            }

            IconButton {
                iconSource: "qrc:/icons/filter1.svg"
                id: filterButton
                smooth: true
                width: 34
                height: 34
                anchors.verticalCenter: parent.verticalCenter
                onClicked: { filterPanel.isOpen = !filterPanel.isOpen }
            }
        }

        Rectangle{
            id: randomButtonBase
            smooth: true
            width: 68
            color: "#058800"
            height: 34
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            radius: height / 2

            IconButton {
                id: randomButton
                smooth: true
                width: 34
                height: 34
                anchors.centerIn: parent

                onClicked: aboba.randomSelection()
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
        
        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20

            RandomImageSelector {
                id: aboba
                Layout.alignment: Layout.Center
            }

        }

        // Image {
        //     anchors.centerIn: parent
        //     source: "../../resources/img/Aatrox_0.jpg"    
        // }
    }
}