import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtGraphicalEffects 1.15
import QtPositioning 5.15
import QtLocation 5.15

import "../Helpers" as Helpers
import "../Widgets" as Widgets

Item {

    property bool isInfraredActive
    property bool isHeatActive: true
    property bool isCamActive: true

    anchors.fill: parent

    Grid{
        columns: 3
        columnSpacing: 40
        rowSpacing: 40

        Rectangle{
            width: 300; height: 300
            color: "#1D1D35"
            radius: 25
            Helpers.CircleIndicator{
                idOfWidget: "CPUHeat"
                textColor: "white"
                centerTextColor: "#03E3AF"
                progressColorOfWidget: "#03E3AF"
                dialColorOfWidget: "#1D1D35"
                headerText: "CPU Sıcaklığı"
                centerSuffix: "°C"
                bottomText2: ""
            }
        }

        Rectangle{
            width: 300; height: 300
            color: "#1D1D35"
            radius: 25
            Helpers.CircleIndicator{
                idOfWidget: "batteryLevel"
                textColor: "white"
                centerTextColor: "#03E3AF"
                progressColorOfWidget: "#03E3AF"
                dialColorOfWidget: "#1D1D35"
                headerText: "Batarya Seviyesi"
                minValueOfWidget: 0
                maxValueOfWidget: 2815
                centerSuffix: "mAh"
                valueOfWidget: 1259
                bottomText2: ""
                bottomText1: "Kalan"
            }
        }

        Rectangle{
            width: 300; height: 300
            color: "#1D1D35"
            radius: 25
            Helpers.CircleIndicator{
                idOfWidget: "RAMUsage"
                textColor: "white"
                centerTextColor: "#03E3AF"
                progressColorOfWidget: "#03E3AF"
                dialColorOfWidget: "#16172E"
                headerText: "RAM Kullanımı"
                centerSuffix: "%"
                valueOfWidget: 78
                attentionColorMode: true
            }
        }

        Rectangle{
            width: 300; height: 300
            color: "#F3F7FD"
            radius: 25

            ColumnLayout{
                width: 300
                height: 250
                Layout.alignment: Qt.AlignTop
                Image{
                    id: camIcon
                    source: isCamActive?  "qrc:/Assets/Images/CamIcon.png" : "qrc:/Assets/Images/CamIconDeactive.png"
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 100
                    Layout.alignment: Qt.AlignTop
                    scale: .6
                    Text {
                        id: camText
                        anchors.left: camIcon.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: camIcon.verticalCenter
                        text: isCamActive? "Kamera Modulü Aktif" : "Kamera Modülü Devre Dışı"
                        font{
                            family: "Montserrat"
                            pixelSize: 22
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: isCamActive = !isCamActive
                    }
                }

                Image{
                    id: heatIcon
                    source: isHeatActive?  "qrc:/Assets/Images/HeatIcon.png" : "qrc:/Assets/Images/HeatIconDeactive.png"
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 100
                    Layout.alignment: Qt.AlignTop
                    Layout.topMargin: -20

                    scale: .6
                    Text {
                        id: heatIconText
                        anchors.left: heatIcon.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: heatIcon.verticalCenter
                        text: isHeatActive? "Sıcaklık Modulü Aktif" : "Sıcaklık Modülü Devre Dışı"
                        font{
                            family: "Montserrat"
                            pixelSize: 22
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: isHeatActive = !isHeatActive
                    }
                }


                Image{
                    id: infraredIcon
                    source: isInfraredActive? "qrc:/Assets/Images/InfraredIcon.png" : "qrc:/Assets/Images/InfraredIconDeactive.png"
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 100
                    Layout.alignment: Qt.AlignTop
                    Layout.topMargin: -20

                    scale: .6
                    Text {
                        id: infraredIconText
                        anchors.left: infraredIcon.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: infraredIcon.verticalCenter
                        text: isInfraredActive? "Kızılötesi Aktif" : "Kızılötesi Devre Dışı"
                        font{
                            family: "Montserrat"
                            pixelSize: 22
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: isInfraredActive = !isInfraredActive
                    }
                }
            }
        }
        Rectangle{
            width: 300; height: 300
            color: "#1D1D35"
            radius: 25
            Helpers.CircleIndicator{
                idOfWidget: "SWAPUsage"
                textColor: "white"
                centerTextColor: "#03E3AF"
                progressColorOfWidget: "#03E3AF"
                dialColorOfWidget: "#16172E"
                headerText: "SWAP Kullanımı"
                centerSuffix: "%"
                valueOfWidget: 12
            }
        }

        Rectangle{
            width: 300; height: 300
            color: "#F3F7FD"
            radius: 25
            Text {
                id: name
                text: "Cihaz Konumu"
                x: parent.width / 2 - width / 2
                y: 18
                color: "#1D1D35"
                font{
                    pixelSize: 14
                    family: 'Montserrat'
                    weight: Font.Normal
                }
            }

            Plugin {
                id: mapPlugin
                name: "esri" // "mapboxgl", "osm"
            }

            Map {
                id: map
                width: parent.width * 0.73; height: parent.height * 0.73
                plugin: mapPlugin
                anchors.centerIn: parent
                center: QtPositioning.coordinate(39.7977251,30.5202333)
                zoomLevel: 14

                MapQuickItem {

                    sourceItem: Rectangle {
                        objectName: "mapMarker"
                        width: 20; height: 20;
                        color: "green"
                        border.width: 2
                        border.color: "#1E275C"
                        smooth: true
                        radius: 15
                        opacity: 1
                    }
                    coordinate :QtPositioning.coordinate(39.7977251,30.5202333)
                    opacity:1.0
                    anchorPoint: Qt.point(sourceItem.width/2, sourceItem.height/2)
                }
            }

        }

    }



}
