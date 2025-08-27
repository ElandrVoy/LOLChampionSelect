// RandomImageSelector.qml
import QtQuick 2.15

Item {
    id: root
    width: 300
    height: 300
    
    property var imageList: []
    property string currentImage: ""
    property string nextImage: ""
    property int currentIndex: 0

     Rectangle {
        anchors.fill: parent
        color: "transparent"

        // Текущее изображение
        Image {
            id: currentImage
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            source: root.imageList[root.currentIndex]
            opacity: 1
        }

        // Следующее изображение (для плавного перехода)
        Image {
            id: nextImage
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            opacity: 0
        }
    }

    function animateRandomSelection() {
        var newIndex;
        do {
            newIndex = Math.floor(Math.random() * imageList.length);
        } while (newIndex === currentIndex && imageList.length > 1);
        
        // Устанавливаем новое изображение
        nextImage.source = imageList[newIndex];      
        slideAnimation.start();
        console.info(imageList)
        currentIndex = newIndex;
    }

    SequentialAnimation {
        id: slideAnimation

        ScriptAction {
            script: {
                currentImage.source = nextImage.source;
                currentImage.x = 400;
                currentImage.opacity = 0;
            }
        }

        ParallelAnimation {
            NumberAnimation {
                target: currentImage
                property: "x"
                to: 0
                duration: 400
            }

            NumberAnimation {
                target: currentImage
                property: "opacity"
                to: 1
                duration: 400
            }
        }
    }
}