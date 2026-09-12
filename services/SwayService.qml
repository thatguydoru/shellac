// qmllint disable signal-handler-parameters

pragma Singleton

import QtQuick
import Quickshell
import Quickshell.I3
import Quickshell.Io

Singleton {
    readonly property alias scratchpadWindowIds: treeCmd.scratchpadWindowIds
    readonly property alias mode: listener.mode

    I3IpcListener {
        id: listener

        property string mode

        subscriptions: ["window", "mode"]

        onIpcEvent: event => {
            const data = JSON.parse(event.data);
            switch (event.type) {
                case "window":
                    if (data.change === "move" || data.change === "new" || data.change === "close")
                        treeCmd.refresh();
                    break;
                case "mode":
                    mode = data.change;
                    break;
            }
        }
    }

    Process {
        id: treeCmd

        property var tree: null
        property list<int> scratchpadWindowIds

        command: ["swaymsg", "-t", "get_tree"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                treeCmd.tree = JSON.parse(text);
                treeCmd.updateScratchpadWindowIds();
            }
        }

        function updateScratchpadWindowIds() {
            scratchpadWindowIds = tree
                .nodes
                .find(n => n.name === "__i3")
                .nodes
                .find(n => n.name === "__i3_scratch")
                .floating_nodes
        }

        function refresh() {
            running = true;
        }
    }
}
