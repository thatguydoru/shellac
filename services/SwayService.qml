// qmllint disable signal-handler-parameters

pragma Singleton

import QtQuick
import Quickshell
import Quickshell.I3
import Quickshell.Io

Singleton {
    id: root

    readonly property alias scratchpadWindowIds: treeCmd.scratchpadWindowIds
    readonly property alias mode: listener.mode

    signal treeRefreshed(tree: var)

    I3IpcListener {
        id: listener

        property string mode: "default"

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

        property list<int> scratchpadWindowIds

        command: ["swaymsg", "-t", "get_tree"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                const tree = JSON.parse(text);
                treeCmd.updateScratchpadWindowIds(tree);
                root.treeRefreshed(tree);
            }
        }

        function updateScratchpadWindowIds(tree: var) {
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

    function getWorkspaceByNumber(num: int): I3Workspace {
        return I3.workspaces.values.find(w => w.number === num) || null;
    }
}
