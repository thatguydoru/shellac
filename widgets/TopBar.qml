import QtQuick
import QtQuick.Layouts
import Quickshell

import "../settings"
import "../services"
import "statmods"
import "statmods/sway"

PanelWindow { // qmllint disable uncreatable-type
    id: bar

    color: "transparent"
    implicitHeight: MiscSettings.topBarHeight

    anchors {
        top: true
        left: true
        right: true
    }

    margins { // qmllint disable unqualified unresolved-type
        top: SpacingSettings.small
        left: SpacingSettings.small
        right: SpacingSettings.small
        // @note: no bottom margin as the compositor must provide gaps
    }

    Rectangle {
        color: ColorSettings.primary
        radius: MiscSettings.rectRoundness
        implicitHeight: bar.height
        implicitWidth: bar.width * MiscSettings.topBarWidthFactor
        anchors.centerIn: parent

        RowLayout {
            spacing: SpacingSettings.small
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: SpacingSettings.base

            Separator {}
            SwayWorkspacesStatModule {}
            Separator {}
            SwayScratchpadStatModule {}
        }

        RowLayout {
            spacing: SpacingSettings.small
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: SpacingSettings.base

            StatModule {
                icon.name: NetworkService.stateIconName
                iconSize: IconSettings.small
            }
            Separator {}
            TimeStatModule {}
            Separator {}
        }
    }

    component Separator: Rectangle {
        color: Qt.darker(ColorSettings.primary, 1.8)
        implicitHeight: parent.implicitHeight * 0.4
        implicitWidth: 2
    }
}
