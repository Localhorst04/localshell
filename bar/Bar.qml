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

                FontLoader { id: kameronReg;  source: "../assets/fonts/static/Kameron-Regular.ttf" }
                FontLoader { id: kameronMed;  source: "../assets/fonts/static/Kameron-Medium.ttf" }
                FontLoader { id: kameronSemi; source: "../assets/fonts/static/Kameron-SemiBold.ttf" }
                FontLoader { id: kameronBold; source: "../assets/fonts/static/Kameron-Bold.ttf" }

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