import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

import "../../services"
import "../../settings"

StatModule {
    contentItem: RowLayout {
        spacing: SpacingSettings.base

        IconImage {
            source: Quickshell.iconPath(NetworkService.stateIconName)
            implicitSize: IconSettings.small
        }

        IconImage {
            source: Quickshell.iconPath(BluetoothService.stateIconName)
            implicitSize: IconSettings.small
        }
    }
}
