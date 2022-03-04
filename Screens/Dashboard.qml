import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtPositioning 5.15
import QtLocation 5.15


import "../Helpers/" as Helpers
import "../Widgets/" as Widgets

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
            activePage: "dashboard"
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

            ColumnLayout{
                anchors.fill: parent
                anchors.left: backgroundOfCard.left
                anchors.leftMargin: 200

                Rectangle{
                    width: 900
                    height: 300
                    color: "#F3F7FD"
                    radius: 60

                    Text {
                        id: name
                        text: "Çevresel Veriler"
                        x: parent.width / 2 - width / 2
                        y: 18
                        font{
                            pixelSize: 14
                            family: 'DM Sans'
                            weight: Font.Normal
                        }
                    }


                    Item{
                        id: slideableChartItem
                        width: 600
                        height: 250
                        clip: true

                        anchors{
                            top: parent.top
                            topMargin: 40
                            left: parent.left
                            leftMargin: 150
                        }

                        ListView {
                            id: slideableChartsBottom
                            focus: true
                            anchors.fill: parent

                            snapMode: ListView.SnapOneItem
                            highlightRangeMode: ListView.StrictlyEnforceRange
                            highlightMoveDuration: 250
                            orientation: ListView.Horizontal
                            boundsBehavior: Flickable.StopAtBounds

                            model: ListModel {
                                ListElement {component: "qrc:/Widgets/TemperatureChart.qml"}
                                ListElement {component: "qrc:/Widgets/AltitudeChart.qml"}

                            }

                            delegate: Loader {
                                width: slideableChartsBottom.width
                                height: slideableChartsBottom.height

                                source: component
                                asynchronous: true
                            }
                        }
                    }

                    Image {
                        id: swipeRight
                        /*
                         *swipeRight id'li modül içinde dashoard'ın üst kısmında bulunan slider yapının oklarına
                         *tıklayınca kayma özelliği sağlayan işlevsellik verilmiştir
                         */
                        height: 96
                        width: 35//parent.width

                        x: slideableChartItem.width + slideableChartItem.x + slideableChartItem.x /4
                        y: slideableChartItem .height / 2
                        source: "qrc:/Assets/Images/swipe-right-icon.png"

                        MouseArea {
                            anchors.fill: parent
                            id: swipeRightArea

                            SmoothedAnimation {
                                target: slideableChartsBottom
                                property: "contentX"
                                running: swipeRightArea.pressed
                                velocity: 100000
                                to: slideableChartsBottom.contentWidth - slideableChartsBottom.width
                            }
                            onClicked: {
                                if (!slideableChartsBottom.atXEnd)
                                    slideableChartsBottom.flick(0, -1000)
                            }
                        }
                    }
                    Image {
                        id: swipeLeft

                        /*
                         *swipeLeft id'li modül içinde dashoard'ın üst kısmında bulunan slider yapının oklarına
                         *tıklayınca kayma özelliği sağlayan işlevsellik verilmiştir
                         */

                        height: 96
                        width: 35//parent.width

                        x: slideableChartItem.x /2
                        y: slideableChartItem .height / 2
                        source: "qrc:/Assets/Images/swipe-left-icon.png"

                        MouseArea {
                            anchors.fill: parent
                            id: swipeLeftArea

                            SmoothedAnimation {
                                target: slideableChartsBottom
                                property: "contentX"
                                running: swipeLeftArea.pressed
                                velocity: 100000
                                to: 0
                            }
                            onClicked: {
                                if (!slideableChartsBottom.atXBeginning)
                                    slideableChartsBottom.flick(0, 1000)
                            }
                        }
                    }
                }

                GridLayout{
                    id: dashboardGrid

                    columns: 2

                    x: 300; y: 40
                    rowSpacing: 40
                    columnSpacing: 40

                    Rectangle{
                        width: 430; height: 300
                        color: "#F3F7FD"
                        radius: 60
                        Text {
                            text: "Cihaz Konumu"
                            x: parent.width / 2 - width / 2
                            y: 18
                            font{
                                pixelSize: 14
                                family: 'DM Sans'
                                weight: Font.Normal
                            }
                        }

                        Plugin {
                            id: mapPlugin
                            name: "esri" // "mapboxgl", "esri", ...

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

                    Rectangle{
                        width: 430; height: 300
                        color: "#1D1D35"
                        radius: 60
                        clip: true

                        Item{
                            id: tempId
                            width: 430
                            height: 280
                            clip: true
                            ListView {
                                id: slideableCharts
                                focus: true
                                anchors.fill: parent

                                snapMode: ListView.SnapOneItem
                                highlightRangeMode: ListView.StrictlyEnforceRange
                                highlightMoveDuration: 250
                                orientation: ListView.Horizontal
                                boundsBehavior: Flickable.StopAtBounds

                                model: ListModel {
                                    ListElement {component: "qrc:/Widgets/RAMUsage.qml"}
                                    ListElement {component: "qrc:/Widgets/CPUUsage.qml"}
                                }

                                delegate: Loader {
                                    width: slideableCharts.width
                                    height: slideableCharts.height

                                    source: component
                                    asynchronous: true
                                }
                            }
                        }

                    }
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

