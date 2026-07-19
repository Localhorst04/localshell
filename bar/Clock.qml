import Quickshell.Io
import QtQuick

Item {
    id: clock
    anchors.verticalCenter: parent.verticalCenter

    property int clockMode: 0
    property var formats: ["+%H:%M:%S", "+%A, %B %d %Y %H:%M:%S"]
    property string time

    Text {
        id: label
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 1

        MouseArea {
            anchors.fill: parent
            onClicked: swapClockFormat()
        }

        text: clock.time
        font {
            pixelSize: 16
            family: kameronReg.name
        }
    }

    Process {
        id: dateProc
        command: ["date", "+%H:%M:%S"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: clock.time = this.text
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }

    function swapClockFormat() {
        clockMode = (clockMode + 1) % formats.length
        dateProc.command = ["date", formats[clockMode]]
        dateProc.running = true
    }
}