import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

import qs.bar.components.quickinfoitems
import qs.animations

Rectangle {
    height: parent.height
    width: quickInfo.width
    radius: height / 2.8

    color: "gray"

    ExpandCollapse on implicitWidth {}

    Row {
        id: quickInfo
        height: parent.height
        layoutDirection: Qt.RightToLeft
        spacing: 4.0

        rightPadding: 2.5
        leftPadding: 2.5

        Battery {}
        Bluetooth {}
    }
}