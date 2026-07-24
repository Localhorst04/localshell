pragma Singleton
import QtQuick

QtObject {
    readonly property string btconnected: Qt.resolvedUrl("./bluetooth-connected.svg")
    readonly property string bluetooth: Qt.resolvedUrl("./bluetooth.svg")
    readonly property string charging: Qt.resolvedUrl("./charging.svg")

    readonly property string wifi: Qt.resolvedUrl("./wifi/wifi.svg")
    readonly property string wifiLow: Qt.resolvedUrl("./wifi/wifi-low.svg")
    readonly property string wifiZero: Qt.resolvedUrl("./wifi/wifi-zero.svg")
    readonly property string wifiHigh: Qt.resolvedUrl("./wifi/wifi-high.svg")
}