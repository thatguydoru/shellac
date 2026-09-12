pragma Singleton

import QtQuick
import Quickshell

Singleton {
    readonly property real small: 12
    readonly property real base: 16
    readonly property real big: 24
    readonly property real bigger: 32

    readonly property string focusWindowsIcon: "focus-windows-symbolic"

    readonly property string networkWirelessAcquiringIcon:       "network-wireless-acquiring-symbolic"
    readonly property string networkWirelessNoRouteIcon:         "network-wireless-no-route-symbolic"
    readonly property string networkWirelessDisabledIcon:        "network-wireless-disabled-symbolic"
    readonly property string networkWirelessSignalExcellentIcon: "network-wireless-signal-excellent-symbolic"
    readonly property string networkWirelessSignalGoodIcon:      "network-wireless-signal-good-symbolic"
    readonly property string networkWirelessSignalOkIcon:        "network-wireless-signal-ok-symbolic"
    readonly property string networkWirelessSignalWeakIcon:      "network-wireless-signal-weak-symbolic"
    readonly property string networkWirelessSignalNoneIcon:      "network-wireless-signal-none-symbolic"

    readonly property string networkWiredAcquiringIcon: "network-wired-acquiring-symbolic"
    readonly property string networkWiredIcon: "network-wired-symbolic"
}
