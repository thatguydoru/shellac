import QtQuick

import "../../services"
import "../../settings"

StatModule {
    icon.name: BluetoothService.defaultAdapterStateIconName
    iconSize: IconSettings.small
    Component.onCompleted: console.log(icon.name)
}
