import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

import "../Helpers" as Helpers
import "../Widgets" as Widgets

Item {

    property double weatherValue: 60

    id: root
    width: 1280
    height: 960
    visible: true
    Rectangle{
        id: rootRectangle
        color: "#DDDDDD"
        anchors.fill: parent

        Widgets.Sidebar{
            id: sidebar
            activePage: "system"
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.width
            y: parent.height / 2 - height / 2
            z:1

            anchors{
                left: parent.left
                leftMargin: 30
            }
        }

        Rectangle{
            id: backgroundOfCard
            color: "white"
            width: root.width * 0.9; height: root.height * 0.75
            radius: 20
            anchors{
                left: sidebar.right
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
                leftMargin: 0
            }
            Widgets.SystemGrid{
                id: systemGrid
                anchors{
                    left: backgroundOfCard.right
                    leftMargin: 170
                    topMargin: 40
                }
            }

        }

        DropShadow {
            anchors.fill: backgroundOfCard
            cached: true
            horizontalOffset: 0
            verticalOffset: 45
            radius: 8.0
            samples: 17
            spread: 0

            color: "#10000000"
            source: backgroundOfCard
        }

    }


}





