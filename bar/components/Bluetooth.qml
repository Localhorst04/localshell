// import Quickshell.Bluetooth
import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Bluetooth
import Quickshell.Widgets

import qs.bar.components

Item {
    id: bluetooth
    height: parent.height * 0.76
    width: 54
    anchors.verticalCenter: parent.verticalCenter
        
    property var adapter: Bluetooth.defaultAdapter
    property bool anyConnected: adapter.devices.values.some(d => d.state === BluetoothDeviceState.Connected)
    property var connectedDevice: adapter.devices.values.find(d => d.state === BluetoothDeviceState.Connected)

    BatteryBar {
        id: batteryBar
        visible: anyConnected && connectedDevice.batteryAvailable
        percentage: connectedDevice.battery
    }

    Text {
        id: label
        visible: anyConnected && connectedDevice.batteryAvailable

        anchors.left: parent.left
        anchors.leftMargin: 5.0

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 1

        text: Math.round(connectedDevice.battery * 100) + "%"
        font {
            pixelSize: 12
            family: kameronReg.name
        }
    }

    Image {
        id: icon
        visible: adapter.enabled

        anchors.verticalCenter: parent.verticalCenter

        anchors.right: parent.right
        anchors.rightMargin: 4.0

        source: Qt.resolvedUrl(
            anyConnected ? "../../assets/icons/bluetooth-connected.svg" : "../../assets/icons/bluetooth.svg"
        )

        sourceSize.height: 12
        fillMode: Image.PreserveAspectFit
    }
}