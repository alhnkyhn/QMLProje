import QtQuick 2.15
import QtQuick.Window 2.15

import "./Screens/"

Window {
    id: root
    width: 1280
    height: 960
    visible: true
    title: qsTr("TEI")

    Loader{
        id:mainLoader
        source: "Screens/LoginScreen.qml"
        onSourceChanged: loadAnimation.running = true
        NumberAnimation {
            id: loadAnimation
            target: mainLoader.item
            property: "scale"
            duration: 100
            from: .995
            to: 1
        }
    }

}
