import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

import qs.bar.components.quickinfoitems
import qs.animations

Row {
    id: btRow
    anchors.centerIn: parent
    layoutDirection: Qt.RightToLeft
    height: implicitHeight
    spacing: 4.0

    leftPadding: 6.0
    rightPadding: 6.0
    topPadding: 3.0
    bottomPadding: 3.0

    readonly property color bgColor: "transparent"
    readonly property string btConnectedPath: "../../../assets/icons/bluetooth-connected.svg"
    readonly property string btIconPath: "../../../assets/icons/bluetooth.svg"

    Rectangle {   
        width: btIcon.implicitWidth
        height: btIcon.implicitHeight
        color: bgColor

        Image {
            id: btIcon

            source: Qt.resolvedUrl(
                anyConnected ? btConnectedPath : btIconPath
            )
            sourceSize.height: 14
            opacity: btRow.width > 0 ? 1 : 0

        }
    }

    Rectangle {
        id: labelcontainer
        width:  anyConnected &&  connectedDevice.batteryAvailable ? label.implicitWidth : 0
        height: label.height

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
