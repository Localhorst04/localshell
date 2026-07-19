import Quickshell.Services.UPower
import QtQuick

Item {
    id: battery

    anchors.verticalCenter: parent.verticalCenter
    anchors.verticalCenterOffset: 1

    implicitHeight: label.implicitHeight
    implicitWidth: label.implicitWidth

    property var device: UPower.displayDevice

    Text {
        id: label
        anchors.centerIn: parent
        text: Math.round(battery.device.percentage * 100) + "%"
        font {
            pixelSize: 14
            family: kameronBold.name
            bold: true
        }
    }
}