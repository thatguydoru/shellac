import QtQuick

import ".."
import "../../components"
import "../../../services"
import "../../../settings"

StatModule {
    visible: SwayService.mode !== "default"
    contentItem: StyledText {
        opacity: SwayService.mode !== "default"
        text: `swaymode:${SwayService.mode}`
        font.pointSize: FontSettings.small
    }
}
