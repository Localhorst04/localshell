import QtQuick
import QtQuick.Layouts
import qs.bar.components

Row {
    id: quickInfo
    height: bar.height

    layoutDirection: Qt.RightToLeft
    spacing: 6.0

    Battery {}
    Bluetooth {}
}