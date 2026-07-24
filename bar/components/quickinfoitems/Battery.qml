import Quickshell.Services.UPower
import QtQuick

import qs.assets.icons
import qs.animations

QuickInfoItem {
    id: battery
    implicitWidth: batteryRow.width

    property var device: UPower.displayDevice
    property bool discharging: device.state === UPowerDeviceState.Discharging

    Row {
        id: batteryRow
        anchors.centerIn: parent
        layoutDirection: Qt.RightToLeft
        height: implicitHeight
        spacing: -2.0

        leftPadding: discharging ? 1 : -1.0
        rightPadding: 1.0

        Rectangle {
            width: label.implicitWidth
            height: label.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 1.0
            color: "transparent"

            Text {
                id: label
                anchors.right: parent.right
                font {
                    pixelSize: 15
                    family: kameronReg.name
                    bold: true
                }
                text: Math.round(battery.device.percentage * 100) + "%"
            }
        }

        Rectangle {
            id: btIconContainer
            width: discharging ? 0 : batteryIcon.implicitWidth
            height: batteryIcon.height
            color: "transparent"

            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 2.5
            Image {
                id: batteryIcon
                source: Icons.charging
                sourceSize.height: 12
                opacity: btIconContainer.width > 0 ? 1 : 0
            }
            BatteryCharge on width {}
        }
    }
}
