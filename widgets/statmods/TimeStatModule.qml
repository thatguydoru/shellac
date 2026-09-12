import QtQuick

import "../components"
import "../../services"

StatModule {
    contentItem: StyledText {
        text: Qt.formatTime(TimeService.date, "hh:mm")
    }
}
