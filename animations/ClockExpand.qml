import QtQuick

Behavior {
    NumberAnimation {
        duration: 350
        easing.type: Easing.OutBack
        easing.overshoot: 2.5
    }
}