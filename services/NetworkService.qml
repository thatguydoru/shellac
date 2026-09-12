// qmllint disable unresolved-type

pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    readonly property string stateIconName: makeIconNameForDevice(connectedDevice)
    readonly property NetworkDevice connectedDevice: getConnectedDevice()
    readonly property Network connectedNetwork: getConnectedNetwork(connectedDevice)

    function getConnectedNetwork(dev: NetworkDevice): Network {
        return dev?.networks.values.find(n => n.connected) || null;
    }

    function getConnectedDevice(): NetworkDevice {
        return Networking.devices.values.find(n => n.connected) || null;
    }

    // network-<conn-state>-symbolic
    function makeIconNameForDevice(dev: NetworkDevice): string {
        return ["network", deviceStateStr(dev), "symbolic"].join("-");
    }

    function deviceStateStr(dev: NetworkDevice): string {
        switch (dev?.state) {
            case ConnectionState.Connecting:
                return dev.type === DeviceType.Wifi ? "wireless-acquiring" : "wired-acquiring";
            case ConnectionState.Connected:
                return dev.type === DeviceType.Wifi ? wifiStrengthStr(getConnectedNetwork(dev)) : "wired"
            case ConnectionState.Unknown:
                return dev.type === DeviceType.Wifi ? "wireless-no-route" : "wired-no-route";
            case ConnectionState.Disconnecting:
            case ConnectionState.Disconnected:
                return dev.type === DeviceType.Wifi ? "wireless-offline" : "wired-disconnected";
            default:
                return "wired-disconnected"
        }
    }

    function wifiStrengthStr(net: WifiNetwork): string {
        if (!net) return "wireless-acquiring";

        if (net.signalStrength >= 0.9)
            return "wireless-signal-excellent";
        else if (net.signalStrength >= 0.75 && net.signalStrength < 0.9)
            return "wireless-signal-good";
        else if (net.signalStrength >= 0.5 && net.signalStrength < 0.75)
            return "wireless-signal-ok";
        else if (net.signalStrength >= 0.2 && net.signalStrength < 0.5)
            return "wireless-signal-weak";

        return "wireless-signal-none";
    }
}
