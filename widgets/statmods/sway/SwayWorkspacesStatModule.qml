pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.I3

import ".."
import "../../components"
import "../../../settings"
import "../../../services"

StatModule {
    contentItem: RowLayout {
        spacing: SpacingSettings.small

        Repeater {
            model: 9

            Loader {
                id: loader

                required property int modelData
                readonly property I3Workspace workspace: SwayService.getWorkspaceByNumber(modelData + 1)

                sourceComponent: workspace ? active : inactive

                Component {
                    id: active

                    StyledText {
                        text: loader.workspace.number
                        color: loader.workspace.focused ? ColorSettings.info : ColorSettings.text
                        font.bold: loader.workspace.focused
                    }
                }

                Component {
                    id: inactive

                    Rectangle {
                        color: ColorSettings.text
                        implicitHeight: SpacingSettings.small
                        implicitWidth: SpacingSettings.base
                        radius: MiscSettings.rectRoundness
                    }
                }
            }
        }
    }
}
