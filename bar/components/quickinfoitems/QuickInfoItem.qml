import QtQuick

Rectangle {
    property real verticalMargin: 10.0
    property real horizontalPadding: 8.0
    height: parent.height - verticalMargin
    width: implicitWidth + horizontalPadding

    radius: height / 2.8
    anchors.verticalCenter: parent.verticalCenter

    border.width: 1.2
    border.color: "black"
    color: "transparent"
}
