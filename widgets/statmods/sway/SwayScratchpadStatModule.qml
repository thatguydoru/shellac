import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

import ".."
import "../../components"
import "../../../services"
import "../../../settings"

StatModule {
    visible: SwayService.scratchpadWindowIds.length > 0
    contentItem: RowLayout {
        spacing: SpacingSettings.smaller

        IconImage {
            source: Quickshell.iconPath("focus-windows-symbolic")
            implicitSize: IconSettings.small
        }

        StyledText {
            text: SwayService.scratchpadWindowIds.length
        }
    }
}
