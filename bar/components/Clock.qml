import Quickshell.Io
import QtQuick

import qs.animations

Item {
    id: clock
    implicitHeight: parent.height
    width: implicitWidth

    property real paddings: 20

    property int clockMode: 0
    property var formats: ["+%H:%M:%S", "+%A, %B %d %Y %H:%M:%S"]
    property string time

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }

    Process {
        id: dateProc
        command: ["date", formats[clockMode]]
        running: true
        stdout: StdioCollector {
            onStreamFinished: clock.time = this.text
        }
    }

    function swapClockFormat() {
        clockMode = (clockMode + 1) % formats.length
        dateProc.running = true
    }

    Rectangle {
        height: parent.height
        width: label.width + paddings
        radius: height / 2.8

        anchors.centerIn: parent

        color: "gray"
        border.color: "black"
        border.width: 2.5

        ClockExpand on width {}
        clip: true

        Text {
            id: label
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 1.0

            font {
                pixelSize: 18
                family: kameronReg.name
                bold: true
                italic: true
            }

            text: clock.time

            MouseArea {
                anchors.fill: parent
                onClicked: swapClockFormat()
            }
        }
    }
}
