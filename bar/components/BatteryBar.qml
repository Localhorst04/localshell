import QtQuick
import QtQuick.Layouts

Item {
    id: batteryBar
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    width: bluetooth.width
    height: bluetooth.height

    property real percentage: 0.0

    readonly property real blendWidth: 0.3
    readonly property real halfBlend: blendWidth / 2
    readonly property real greenStop: Math.max(0, percentage - halfBlend)
    readonly property real orangeStop: Math.min(1, Math.max(greenStop, percentage + halfBlend))

    readonly property color colorFull: "#4caf50"
    readonly property color colorLow: "#ff9800"
    readonly property color colorEmpty: "#f44336"

    readonly property bool batteryCirtical: percentage <= 0.19 || percentage >= 1.0

    Rectangle {
        anchors.fill: parent
        visible: !batteryCirtical
        radius: height / 2

        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: greenStop; color: colorFull }
            GradientStop { position: orangeStop; color: colorLow }
        }
    }

    Rectangle {
        anchors.fill: parent
        visible: batteryCirtical
        radius: height / 2

        color: percentage >= 1.0 ? colorFull : colorEmpty
    }
}