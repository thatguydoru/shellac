import QtQuick

import ".."
import "../../components"
import "../../../services"
import "../../../settings"

StatModule {
    visible: SwayService.mode !== "default"
    contentItem: StyledText {
        text: SwayService.mode
        font.pointSize: FontSettings.small
    }
}
