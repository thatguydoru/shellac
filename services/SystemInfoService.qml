pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    readonly property alias ramTotalGb: freeCmd.totalGb
    readonly property alias ramUsedGb: freeCmd.usedGb
    readonly property alias ramAvailableGb: freeCmd.availableGb
    readonly property alias ramFreeGb: freeCmd.freeGb
    readonly property alias ramCachedGb: freeCmd.cachedGb
    readonly property real ramUsedPercent: ramUsedGb / ramTotalGb * 100

    readonly property alias rootDevice: dfCmd.device
    readonly property alias rootTotalGb: dfCmd.totalGb
    readonly property alias rootUsedGb: dfCmd.usedGb
    readonly property alias rootAvailableGb: dfCmd.availableGb
    readonly property alias rootUsedPercent: dfCmd.usedPercent

    Process {
        id: freeCmd

        property real totalGb
        property real usedGb
        property real freeGb
        property real cachedGb
        property real availableGb

        command: ["sh", "-c", "free --giga -h | grep -i mem"]
        stdout: StdioCollector {
            onStreamFinished: {
                const meminfo = text.split(/\s+/);
                freeCmd.totalGb = parseFloat(meminfo[1]);
                freeCmd.usedGb = parseFloat(meminfo[2]);
                freeCmd.freeGb = parseFloat(meminfo[3]);
                freeCmd.cachedGb = parseFloat(meminfo[5]);
                freeCmd.availableGb = parseFloat(meminfo[6]);
            }
        }
    }

    Process {
        id: dfCmd

        property string device
        property real totalGb
        property real usedGb
        property real availableGb
        property real usedPercent

        command: ["sh", "-c", "df -H | grep /$"]
        stdout: StdioCollector {
            onStreamFinished: {
                const diskinfo = text.split(/\s+/);
                dfCmd.device = diskinfo[0];
                dfCmd.totalGb = parseFloat(diskinfo[1]);
                dfCmd.usedGb = parseFloat(diskinfo[2]);
                dfCmd.availableGb = parseFloat(diskinfo[3]);
                dfCmd.usedPercent = parseFloat(diskinfo[4]);
            }
        }
    }

    Timer {
        interval: 5000
        repeat: true
        triggeredOnStart: true
        running: true

        onTriggered: freeCmd.running = true
    }

    Timer {
        interval: 10000
        repeat: true
        triggeredOnStart: true
        // running: true

        onTriggered: dfCmd.running = true;
    }
}
