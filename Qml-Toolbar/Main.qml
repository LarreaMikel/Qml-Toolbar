import QtQuick 2.4
import Ubuntu.Components 1.3

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "qml-toolbar.larreamikel"

    width: units.gu(100)
    height: units.gu(75)

    PageHeader {
        id: editHeader
        property Component delegate: Component {
            AbstractButton {
                id: button
                action: modelData
                width: label.width + units.gu(4)
                height: parent.height
                Rectangle {
                    color: UbuntuColors.slate
                    opacity: 0.1
                    anchors.fill: parent
                    visible: button.pressed
                }
                Label {
                    anchors.centerIn: parent
                    id: label
                    text: action.text
                    font.weight: text === "Confirm" ? Font.Normal : Font.Light
                }
            }
        }
        leadingActionBar {
            anchors.leftMargin: 0
            actions: Action {
                text: "Cancel"
                iconName: "close"
            }
            delegate: editHeader.delegate
        }
        trailingActionBar {
            anchors.rightMargin: 0
            actions: Action {
                text: "Confirm"
                iconName: "tick"
            }
            delegate: editHeader.delegate
        }
        extension: Toolbar {
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            trailingActionBar.actions: [
                Action { iconName: "bookmark-new" },
                Action { iconName: "add" },
                Action { iconName: "edit-select-all" },
                Action { iconName: "edit-copy" },
                Action { iconName: "select" }
            ]
            leadingActionBar.actions: Action {
                iconName: "delete"
                text: "delete"
                onTriggered: print("Delete action triggered")
            }
        }
    }
}

