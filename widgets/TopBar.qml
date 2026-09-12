import QtQuick
import QtQuick.Layouts
import Quickshell

import "../settings"
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
            spacing: 0
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: SpacingSettings.base

            Separator {}
            SwayWorkspacesStatModule {}
            Separator {}
            SwayScratchpadStatModule {}
            SwayModeStatModule {}
        }

        RowLayout {
            spacing: 0
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: SpacingSettings.base

            Separator {}
            NetworkStatModule {}
            BluetoothStatModule {}
            Separator {}
            TimeStatModule {}
            Separator {}
        }
    }

    component Separator: Rectangle {
        color: ColorSettings.primaryDarker80
        implicitHeight: parent.implicitHeight * 0.4
        implicitWidth: 2
    }
}
