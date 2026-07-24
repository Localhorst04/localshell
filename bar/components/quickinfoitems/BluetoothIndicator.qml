import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

import qs.assets.icons
import qs.bar.components.quickinfoitems
import qs.animations

Row {
    id: btRow
    anchors.centerIn: parent
    layoutDirection: Qt.RightToLeft
    height: implicitHeight
    spacing: 4.0

    readonly property color bgColor: "transparent"

    Rectangle {
        width: btIcon.implicitWidth
        height: btIcon.implicitHeight
        color: bgColor
        anchors.verticalCenter: parent.verticalCenter

        Image {
            id: btIcon

            source: Qt.resolvedUrl(
                anyConnected ? Icons.btconnected : Icons.bluetooth
            )
            sourceSize.height: 14
            opacity: btRow.width > 0 ? 1 : 0

        }
    }

    Rectangle {
        id: labelcontainer
        width:  anyConnected &&  connectedDevice.batteryAvailable ? label.implicitWidth : 0
        height: label.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 1.0

        color: bgColor
        Text {
            id: label
            text: Math.round(connectedDevice.battery * 100) + "%"
            font {
                pixelSize: 12
                family: kameronReg.name
            }
            opacity: parent.width == label.implicitWidth ? 1 : 0
            ExpandCollapse on opacity {}
        }
    }
}
