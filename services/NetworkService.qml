// qmllint disable unresolved-type

pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
    readonly property string stateIconName: getIconName(connectedDevice)
    readonly property NetworkDevice connectedDevice: getConnectedDevice()
    readonly property Network connectedNetwork: getConnectedNetwork(connectedDevice)

    function getConnectedNetwork(dev: NetworkDevice): Network {
        return dev?.networks.values.find(n => n.connected) || null;
    }

    function getConnectedDevice(): NetworkDevice {
        return Networking.devices.values.find(n => n.connected) || null;
    }

    // network-<device-type>-<device-state>-symbolic
    function getIconName(dev: NetworkDevice): string {
        const icon = ["network", deviceTypeStr(dev?.type), deviceStateStr(dev), "symbolic"];
        return icon.filter(s => !!s).join("-");
    }

    function deviceTypeStr(ty: int): string {
        switch (ty) {
            case DeviceType.Wifi:
                return "wireless";
            default:
                return "wired";
        }
    }

    function deviceStateStr(dev: NetworkDevice): string {
        switch (dev?.state) {
            case ConnectionState.Connecting:
                return "acquiring";
            case ConnectionState.Connected:
                return dev.type === DeviceType.Wifi ? wifiStrengthStr(getConnectedNetwork(dev)) : ""
            case ConnectionState.Unknown:
                return "no-route";
            case ConnectionState.Disconnecting:
            case ConnectionState.Disconnected:
                return dev.type === DeviceType.Wifi ? "offline" : "disconnected";
            default:
                return "disconnected"
        }
    }

    function wifiStrengthStr(net: WifiNetwork): string {
        if (!net) return "acquiring";

        if (net.signalStrength >= 0.9)
            return "signal-excellent";
        else if (net.signalStrength >= 0.75 && net.signalStrength < 0.9)
            return "signal-good";
        else if (net.signalStrength >= 0.5 && net.signalStrength < 0.75)
            return "signal-ok";
        else if (net.signalStrength >= 0.2 && net.signalStrength < 0.5)
            return "signal-weak";
        else
            return "signal-none";
    }
}
