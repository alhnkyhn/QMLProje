import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

ApplicationWindow {
    id: window
    Material.theme: Material.Dark
    Material.accent: Material.color(Material.Purple)
    visible: false

    signal accepted

    property string boxMessage: ""
    property string boxTitle: ""
    property string boxButtonAcceptLabel: "OK"
    property bool boxButtonAcceptHighlighted: true
    property int boxWidth: 300
    property int boxHeight: 150
    property real boxButtonAcceptColor: Material.Blue

    minimumWidth: boxWidth
    maximumWidth: boxWidth
    minimumHeight: boxHeight
    maximumHeight: boxHeight

    title: boxTitle

    Button {
        id: btnOk
        text: boxButtonAcceptLabel

        x: (ApplicationWindow.width - 16) - btnOk.width
        y: (ApplicationWindow.height - 16) - btnOk.height

        highlighted: boxButtonAcceptHighlighted
        Material.accent: Material.color(boxButtonAcceptColor)
        onClicked: {
            accepted()
            window.close()
        }
    }

    Label {
        id: lblMsg
        width: ApplicationWindow.width - 20
        text: boxMessage
        x: 20
        y: 20
        wrapMode: Label.WordWrap
    }
}
