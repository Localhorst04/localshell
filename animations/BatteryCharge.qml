import QtQuick

Behavior {
    NumberAnimation {
        duration: 250
        easing.type: Easing.OutElastic
        easing.amplitude: 3.0
        easing.period: 3.0
    }
}