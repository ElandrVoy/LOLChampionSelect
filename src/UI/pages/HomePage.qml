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
                
                onAccepted: {
                    console.log("Поиск:", text)
                    focus = false
                    // Ваш код поиска
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
    
    Frame {
        id: searchResult
        anchors {
            left:  championPanel.right
            top: searchPanel.bottom
            right: parent.right
            bottom: parent.bottom
        }
        spacing: 0
        padding: 0

        Grid {
            id: gridChampions
            anchors.fill: parent
            columns: 10
            spacing: 0
            padding: 0
            property var items: ['Aatrox', 'Ahri', 'Akali', 'Akshan', 'Alistar', 'Ambessa', 'Amumu', 'Anivia', 'Annie', 'Aphelios', 'Ashe', 'AurelionSol', 'Aurora', 'Azir', 'Bard', 'Belveth', 'Blitzcrank', 'Brand', 'Braum', 'Briar', 'Caitlyn', 'Camille', 'Cassiopeia', 'Chogath', 'Corki', 'Darius', 'Diana', 'Draven', 'DrMundo', 'Ekko', 'Elise', 'Evelynn', 'Ezreal', 'Fiddlesticks', 'Fiora', 'Fizz', 'Galio', 'Gangplank', 'Garen', 'Gnar', 'Gragas', 'Graves', 'Gwen', 'Hecarim', 'Heimerdinger', 'Hwei', 'Illaoi', 'Irelia', 'Ivern', 'Janna', 'JarvanIV', 'Jax', 'Jayce', 'Jhin', 'Jinx', 'Kaisa', 'Kalista', 'Karma', 'Karthus', 'Kassadin', 'Katarina', 'Kayle', 'Kayn', 'Kennen', 'Khazix', 'Kindred', 'Kled', 'KogMaw', 'KSante', 'Leblanc', 'LeeSin', 'Leona', 'Lillia', 'Lissandra', 'Lucian', 'Lulu', 'Lux', 'Malphite', 'Malzahar', 'Maokai', 'MasterYi', 'Mel', 'Milio', 'MissFortune', 'MonkeyKing', 'Mordekaiser', 'Morgana', 'Naafiri', 'Nami', 'Nasus', 'Nautilus', 'Neeko', 'Nidalee', 'Nilah', 'Nocturne', 'Nunu', 'Olaf', 'Orianna', 'Ornn', 'Pantheon', 'Poppy', 'Pyke', 'Qiyana', 'Quinn', 'Rakan', 'Rammus', 'RekSai', 'Rell', 'Renata', 'Renekton', 'Rengar', 'Riven', 'Rumble', 'Ryze', 'Samira', 'Sejuani', 'Senna', 'Seraphine', 'Sett', 'Shaco', 'Shen', 'Shyvana', 'Singed', 'Sion', 'Sivir', 'Skarner', 'Smolder', 'Sona', 'Soraka', 'Swain', 'Sylas', 'Syndra', 'TahmKench', 'Taliyah', 'Talon', 'Taric', 'Teemo', 'Thresh', 'Tristana', 'Trundle', 'Tryndamere', 'TwistedFate', 'Twitch', 'Udyr', 'Urgot', 'Varus', 'Vayne', 'Veigar', 'Velkoz', 'Vex', 'Vi', 'Viego', 'Viktor', 'Vladimir', 'Volibear', 'Warwick', 'Xayah', 'Xerath', 'XinZhao', 'Yasuo', 'Yone', 'Yorick', 'Yunara', 'Yuumi', 'Zac', 'Zed', 'Zeri', 'Ziggs', 'Zilean', 'Zoe', 'Zyra']

            Repeater {
                id: repeater
                model: gridChampions.items.length                

                Frame {
                    width: 120
                    height: width * 1.1
                    id: gridChampionsFrame
                    background: Rectangle {
                        color: "transparent"
                        border.width: 0  // Убедитесь, что граница отключена
                    }

                    required property int index
                    property string imageName: gridChampions.items[index]
                        
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