pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    readonly property Source source: Source {}
    readonly property Sink sink: Sink {}

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSource, Pipewire.defaultAudioSink]
    }

    component Source: QtObject {
        readonly property PwNodeAudio defaultSource: Pipewire.defaultAudioSource?.audio || null
        readonly property string iconName: getIconName(defaultSource)

        function getIconName(node: PwNodeAudio): string {
            if (!node) return "microphone-disabled-symbolic";

            if (node.muted)
                return "microphone-disabled-symbolic";
            else if (node.volume >= 0.75 && node.volume < 1.1)
                return "microphone-sensitivity-high-symbolic";
            else if (node.volume >= 0.4 && node.volume < 0.75)
                return "microphone-sensitivity-medium-symbolic";

            return "microphone-sensitivity-low-symbolic";
        }
    }

    component Sink: QtObject {
        readonly property PwNodeAudio defaultSink: Pipewire.defaultAudioSink?.audio || null
        readonly property string iconName: getIconName(defaultSink)

        function getIconName(node: PwNodeAudio): string {
            if (!node) return "audio-volume-muted-symbolic";

            if (node.muted)
                return "audio-volume-muted-symbolic";
            else if (node.volume >= 1.1)
                return "audio-volume-overamplified-symbolic";
            else if (node.volume >= 0.75 && node.volume < 1.1)
                return "audio-volume-high-symbolic";
            else if (node.volume >= 0.2 && node.volume < 0.75)
                return "audio-volume-medium-symbolic";

            return "audio-volume-low-symbolic";
        }
    }
}
