// import Quickshell.Bluetooth
import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Bluetooth
import Quickshell.Widgets

import qs.bar.components.quickinfoitems
import qs.bar.components.quickinfoitems.bluetooth
import qs.animations

QuickInfoItem {
    id: bluetooth
    implicitWidth: batteryBar.width
    gradient: batteryAvailable && !batteryCirtical ? batteryGradient : null
    color: !batteryAvailable ? "transparent" : batteryLow ? colorEmpty : colorFull

    property var adapter: Bluetooth.defaultAdapter
    property bool anyConnected: adapter.devices.values.some(d => d.state === BluetoothDeviceState.Connected)
    property var connectedDevice: adapter.devices.values.find(d => d.state === BluetoothDeviceState.Connected)

    property bool batteryAvailable: anyConnected && connectedDevice.batteryAvailable
    property bool batteryLow: connectedDevice.battery < 0.2
    property bool batteryFull: connectedDevice.battery >= 1.0
    property bool batteryCirtical: batteryLow || batteryFull

// Gradient readonly props ----------
    readonly property real blendWidth: 0.3
    readonly property real halfBlend: blendWidth / 2
    readonly property real greenStop: Math.max(0, connectedDevice.battery - halfBlend)
    readonly property real orangeStop: Math.min(1, Math.max(greenStop, connectedDevice.battery + halfBlend))

    readonly property color colorFull: "#4caf50"
    readonly property color colorLow: "#ff9800"
    readonly property color colorEmpty: "#f44336"

    Gradient {
        id: batteryGradient
            orientation: Gradient.Horizontal
            GradientStop { position: greenStop; color: colorFull }
            GradientStop { position: orangeStop; color: colorLow }
        }


    BluetoothIndicator {
        id: batteryBar
        anchors.verticalCenter: parent.verticalCenter
        width: adapter.enabled ? batteryBar.implicitWidth : 0
        ExpandItem on width {}
    }
}
