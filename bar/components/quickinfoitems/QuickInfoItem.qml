import QtQuick

Rectangle {
    readonly property real margin: 8.0
    height: parent.height - margin

    radius: height / 2.8
    anchors.verticalCenter: parent.verticalCenter

    border.width: 1.2
    border.color: "black"
    color: "transparent"
}
