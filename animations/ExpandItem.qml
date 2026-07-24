import QtQuick

Behavior {
    NumberAnimation {
        // duration: 200
        easing.type: Easing.OutElastic
        // easing.overshoot: 3.5
        easing.amplitude: 5.5
        easing.period: 2
    }
}