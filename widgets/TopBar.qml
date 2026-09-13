// qmllint disable uncreatable-type unqualified unresolved-type

import QtQuick
import QtQuick.Layouts
import Quickshell

import "../settings"
import "statmods"
import "statmods/sway"

PanelWindow {
    id: bar

    color: "transparent"
    implicitHeight: MiscSettings.topBarHeight

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
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

            SwayModeStatModule {}
        }

        RowLayout {
            spacing: SpacingSettings.small
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: SpacingSettings.base

            Separator {}

            RowLayout {
                spacing: 0

                NetworkStatModule {}
                BluetoothStatModule {}
            }

            Separator {}

            RowLayout {
                spacing: 0

                AudioSinkStatModule {}
                AudioSourceStatModule {}
            }

            Separator {}

            RowLayout {
                spacing: 0

                MemoryStatModule {}
                DiskStatModule {}
            }

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
