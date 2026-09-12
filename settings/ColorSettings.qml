pragma Singleton

import QtQuick
import Quickshell

Singleton {
    readonly property color text: "black"
    readonly property color link: "dodgerblue"
    readonly property color primary: "white"
    readonly property color info: "lightseagreen"
    readonly property color success: "limegreen"
    readonly property color warning: "yellow"
    readonly property color danger: "tomato"

    readonly property color primaryDarker80: Qt.darker(ColorSettings.primary, 1.8)
    readonly property color primaryDarker20: Qt.darker(ColorSettings.primary, 1.2)
}
