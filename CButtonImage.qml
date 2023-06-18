import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: buttonId
    width: 40
    height: width

    property alias source: imageId.source
    property alias color: rectId.color

    background: Rectangle {
        id: rectId
        radius: 5
        color: down ? "#7a7a7a" : "#C0C0C0"
        anchors.fill: parent
    }

    contentItem: Image {
        id: imageId
        anchors.fill: parent
        anchors.margins: 10
    }
}
