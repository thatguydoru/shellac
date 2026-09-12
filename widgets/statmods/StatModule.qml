import QtQuick
import QtQuick.Controls

import "../../settings"

Button {
    id: btn

    property real iconSize

    hoverEnabled: true
    horizontalPadding: SpacingSettings.base
    verticalPadding: MiscSettings.topBarHeight / 2 - contentItem.implicitHeight / 2
    icon.height: iconSize ? iconSize : undefined
    icon.width: iconSize ? iconSize : undefined
    background: Rectangle {
        color: !btn.hovered ? ColorSettings.primary : Qt.darker(ColorSettings.primary, 1.2)
        radius: MiscSettings.rectRoundness
    }
}
