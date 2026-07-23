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
                margins {
                    // top: 4.0
                    left: 4.0
                    right: 4.0
                }
                implicitHeight: 27
                height: implicitHeight
                color: "yellow"

                Clock {
                    anchors.centerIn: parent
                }

                QuickInfo {
                    anchors.right: parent.right
                }
            }
        }
    }
}
