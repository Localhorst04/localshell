import Quickshell
import QtQuick
import qs.bar.components

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        delegate: Component {
            PanelWindow {
                id: bar
                required property var modelData
                screen: modelData

                anchors {
                    top: true
                    left: true
                    right: true
                }
                implicitHeight: 24
                height: implicitHeight
                color: "yellow"

                Clock {
                    anchors.centerIn: parent
                    anchors.verticalCenter: parent.verticalCenter
                }

                QuickInfo {
                    anchors {
                        right: parent.right
                        rightMargin: 12
                    }
                }
            }
        }
    }
}