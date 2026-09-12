// qmllint disable unresolved-type

pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Bluetooth

Singleton {
    readonly property string stateIconName: makeIconNameForAdapter(defaultAdapter)
    readonly property BluetoothAdapter defaultAdapter: Bluetooth.defaultAdapter

    // bluetooth-<device-status>-symbolic
    function makeIconNameForAdapter(adapter: BluetoothAdapter): string {
        const icon = ["bluetooth", adapterStatusStr(adapter), "symbolic"];
        return icon.join("-");
    }

    function adapterStatusStr(adapter: BluetoothAdapter): string {
        switch (adapter?.state) {
            case BluetoothAdapterState.Enabled:
                return "active"
            case BluetoothAdapterState.Blocked:
            case BluetoothAdapterState.Disabled:
                return "disabled";
            case BluetoothAdapterState.Enabling:
            case BluetoothAdapterState.Disabling:
                return "acquiring";
            default:
                return "acquiring";
        }
    }
}
