import QtQuick

import "../components"
import "../../services"

StatModule {
    contentItem: StyledText {
        text: {
            const used = Math.floor(SystemInfoService.ramUsedPercent);
            return `mem:${used <= 99 ? used : 99}%`;
        }
    }
}
