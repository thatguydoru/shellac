import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

import "../components"
import "../../services"
import "../../settings"

StatModule {
    contentItem: RowLayout {
        spacing: SpacingSettings.small

        IconImage {
            source: Quickshell.iconPath("drive-harddisk-system-symbolic")
            implicitSize: IconSettings.small
        }

        StyledText {
            text: {
                const used = Math.floor(SystemInfoService.rootUsedPercent);
                return `${used <= 99 ? used : 99}%`;
            }
        }
    }
}
