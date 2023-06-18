import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: buttonId
    width: 40
    height: width

    background: Rectangle {
        radius: 5
        color: down ? "#7a7a7a" : "#C0C0C0"
        anchors.fill: parent
    }

    contentItem: Text {
        text: buttonId.text
        font.bold: true
        font.family: "Roboto"
        font.pixelSize: 20
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideRight
    }
}
