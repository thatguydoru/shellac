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
            source: Quickshell.iconPath(AudioSerivce.sink.iconName)
            implicitSize: IconSettings.small
        }

        IconImage {
            source: Quickshell.iconPath(AudioSerivce.source.iconName)
            implicitSize: IconSettings.small
        }
    }
}
