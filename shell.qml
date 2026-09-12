//@ pragma IconTheme Adwaita

import QtQuick
import Quickshell

import "widgets"

ShellRoot {
    Variants {
        model: Quickshell.screens

        TopBar {
            required property ShellScreen modelData

            screen: modelData
        }
    }
}
