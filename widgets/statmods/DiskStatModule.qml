import QtQuick

import "../components"
import "../../services"

StatModule {
    contentItem: StyledText {
        text: {
            const used = Math.floor(SystemInfoService.rootUsedPercent);
            return `disk:${used <= 99 ? used : 99}%`;
        }
    }
}
