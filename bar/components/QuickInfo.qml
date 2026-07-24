import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

import qs.bar.components.quickinfoitems
import qs.bar.components.quickinfoitems.bluetooth
import qs.animations

Rectangle {
    height: parent.height
    width: quickInfo.width
    radius: height / 2.8

    border.color: "black"
    border.width: 1.5

    color: "gray"

    Row {
        id: quickInfo
        height: parent.height
        layoutDirection: Qt.RightToLeft
        spacing: 2.0

        rightPadding: 4.0
        leftPadding: 4.0

        Battery {}
        Bluetooth {}
    }
}
