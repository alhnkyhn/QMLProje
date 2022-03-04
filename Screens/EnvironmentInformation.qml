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
            activePage: "env"
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

            RowLayout{
                anchors.fill: parent
                anchors.left: parent.left
                anchors.leftMargin: 180

                Rectangle{

                    width: parent.width * .3
                    height: parent.height * .8
                    radius: 60
                    color: "#F3F7FD"

                    Text{
                        anchors.bottom: thermometerChart.top
                        anchors.bottomMargin: 20
                        x: (parent.width - width) / 2
                        text: "Ortam Sıcaklığı"
                        font{
                            pixelSize: 14
                            family: "Montserrat"
                        }
                    }

                    Widgets.ThermometerQChart{
                        id: thermometerChart
                        height: parent.height * .75
                        y: (parent.height - height) / 2
                        x: (parent.width - width) / 2
                        value: 36
                        max: 60

                        backgroundColor: "#F3F7FD"
                    }
                    Text{
                        anchors.top: thermometerChart.bottom
                        anchors.topMargin: 20
                        x: (parent.width - width) / 2

                        text: thermometerChart.value + "°C"
                        font{
                            pixelSize: 24
                            family: "Consolas"
                        }
                    }
                }
                Rectangle{
                    width: parent.width * .7
                    height: parent.height* .8

                    ColumnLayout{
                        anchors.fill: parent

                        Rectangle{
                            Layout.alignment: Qt.AlignTop
                            clip: true
                            width: parent.width
                            height: (parent.height * .5 ) -20
                            color: "#F3F7FD"
                            radius: 60

                            Text {
                                id: name
                                text: "Çevresel Veriler"
                                x: parent.width / 2 - width / 2
                                y: 18
                                font{
                                    pixelSize: 14
                                    family: 'Montserrat'
                                    weight: Font.Normal
                                }
                            }


                            Item{
                                id: slideableChartItem
                                width: 530
                                height: 200
                                clip: true

                                anchors{
                                    top: parent.top
                                    topMargin: 40
                                    left: parent.left
                                    leftMargin: 90
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

                                height: 96
                                width: 35//parent.width

                                x: slideableChartItem.width + slideableChartItem.x + slideableChartItem.x /10
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


                        Rectangle{
                            width: parent.width * 0.5 -20
                            height: (parent.height * 0.5) -20
                            y: (parent.height / 2) + 20
                            radius: 60
                            color: "#1D1D35"

                            Helpers.CircleIndicator{
                                idOfWidget: "humidityLevel"
                                textColor: "white"
                                centerTextColor: "#03E3AF"
                                progressColorOfWidget: "#03E3AF"
                                dialColorOfWidget: "#1D1D35"
                                headerText: "Nem Seviyesi"
                                minValueOfWidget: 0
                                maxValueOfWidget: 100
                                centerSuffix: "%"
                                valueOfWidget: 66
                                bottomText2: ""
                                heightOfWidget: 150
                                widthOfWidget: 150
                                bottomText1: "Nem Seviyesi"
                                attentionColorMode: true
                            }
                        }

                        Rectangle{
                            width: (parent.width * 0.5) - 20
                            height: (parent.height * 0.5) -20
                            y: (parent.height / 2) + 20
                            x: (parent.width / 2) + 20
                            radius: 60
                            color: "#1D1D35"

                            Helpers.CircleIndicator{
                                idOfWidget: "altitudeLevel"
                                textColor: "white"
                                centerTextColor: "#03E3AF"
                                progressColorOfWidget: "#03E3AF"
                                dialColorOfWidget: "#1D1D35"
                                headerText: "Rakım"
                                minValueOfWidget: 0
                                maxValueOfWidget: 3000
                                centerSuffix: "m"
                                valueOfWidget: 976
                                bottomText2: ""
                                heightOfWidget: 150
                                widthOfWidget: 150
                                bottomText1: "Rakım Seviyesi(m)"

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



