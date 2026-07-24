import QtQuick

Behavior {
    NumberAnimation {
        duration: 250
        easing.type: Easing.OutElastic
        easing.amplitude: 5.5
        easing.period: 3.0
    }
}