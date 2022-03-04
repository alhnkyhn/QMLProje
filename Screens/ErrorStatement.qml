import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtCharts 2.3
import QtPositioning 5.15
import QtLocation 5.15


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
            activePage: "error"
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
                spacing: 50
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 190
                anchors.topMargin: 40


                Text{
                    Layout.alignment: Qt.AlignVCenter
                    Layout.preferredHeight: 40
                    text: "Hata Bildirme Formu"

                    font {
                        family: "Poppins"
                        weight: Font.Bold
                        pixelSize: 30
                    }
                }

                Rectangle{
                    id: firstRect

                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 540
                    Layout.alignment: Qt.AlignTop

                    Text{
                        id: firstQuestion
                        text: "Alınan hata kodu nedir?"

                        font {
                            family: "Poppins"
                            weight: Font.Normal
                            pixelSize: 14
                        }
                    }

                    Rectangle{
                        anchors.top : firstQuestion.bottom

                        width: 540; height: 40
                        border{
                            color: "#D2D2D2"
                            width: 1
                        }

                        RowLayout{
                            Layout.preferredWidth: parent.width
                            Layout.topMargin: 20

                            TextField{
                                placeholderText: ""

                                style: TextFieldStyle {
                                    font{
                                        family: "Poppins"
                                        pixelSize: 13
                                        weight: Font.Normal
                                    }

                                    textColor: "black"
                                    background: Rectangle {
                                        anchors.top : parent.top
                                        anchors.left: parent.left
                                        anchors.topMargin: 3
                                        anchors.leftMargin: 5
                                        implicitWidth: 520
                                        implicitHeight: 40
                                        color: "#00000000"
                                    }
                                    placeholderTextColor: "#858585"
                                }
                            }
                        }
                    }
                }

                Rectangle{
                    id: secondRect

                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 540
                    Layout.alignment: Qt.AlignTop

                    Text{
                        id: secondQuestion
                        text: "Hatayla hangi sayfada karşılaşıldı?"

                        font {
                            family: "Poppins"
                            weight: Font.Normal
                            pixelSize: 14
                        }
                    }

                    Rectangle{

                        anchors.top : secondQuestion.bottom
                        width: 540; height: 40
                        border{
                            color: "#D2D2D2"
                            width: 1
                        }

                        RowLayout{
                            Layout.preferredWidth: parent.width
                            Layout.topMargin: 20

                            TextField{
                                placeholderText: "Hata ile .... sayfasında karşılaştım."

                                style: TextFieldStyle {
                                    font{
                                        family: "Poppins"
                                        pixelSize: 13
                                        weight: Font.Normal
                                    }

                                    textColor: "black"
                                    background: Rectangle {
                                        anchors.top : parent.top
                                        anchors.left: parent.left
                                        anchors.topMargin: 3
                                        anchors.leftMargin: 5
                                        implicitWidth: 520
                                        implicitHeight: 40
                                        color: "#00000000"
                                    }
                                    placeholderTextColor: "#858585"
                                }
                            }
                        }
                    }
                }

                Rectangle{


                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 540
                    Layout.alignment: Qt.AlignTop

                    Text{
                        id: thirdQuestion
                        text: "Hatayla nasıl karşılaşıldı?"

                        font {
                            family: "Poppins"
                            weight: Font.Normal
                            pixelSize: 14
                        }
                    }

                    Rectangle{
                        id: thirdRext
                        anchors.top : thirdQuestion.bottom

                        width: 540; height: 40
                        border{
                            color: "#D2D2D2"
                            width: 1
                        }

                        RowLayout{
                            Layout.preferredWidth: parent.width
                            Layout.topMargin: 20

                            TextField{
                                placeholderText: "Hata oluşmadan önceki yaptığınız işlemlerden bahsediniz."

                                style: TextFieldStyle {
                                    font{
                                        family: "Poppins"
                                        pixelSize: 13
                                        weight: Font.Normal
                                    }

                                    textColor: "black"
                                    background: Rectangle {
                                        anchors.top : parent.top
                                        anchors.left: parent.left
                                        anchors.topMargin: 3
                                        anchors.leftMargin: 5
                                        implicitWidth: 520
                                        implicitHeight: 40
                                        color: "#00000000"
                                    }
                                    placeholderTextColor: "#858585"
                                }
                            }
                        }
                    }
                }

                Rectangle{


                    Layout.preferredHeight: 160
                    Layout.preferredWidth: 540
                    Layout.alignment: Qt.AlignTop

                    Text{
                        id: fourthQuestion
                        text: "Eklemek istedikleriniz"

                        font {
                            family: "Poppins"
                            weight: Font.Normal
                            pixelSize: 14
                        }
                    }

                    Rectangle{
                        anchors.top : fourthQuestion.bottom
                        Layout.preferredHeight: 160
                        Layout.preferredWidth: 540
                        border{
                            color: "#D2D2D2"
                            width: 1
                        }

                        RowLayout{
                            Layout.preferredWidth: parent.width

                            TextArea{

                                Layout.preferredHeight: 160
                                Layout.preferredWidth: 540
                                backgroundVisible: false
                                style: TextAreaStyle{
                                    font {
                                        family: "Poppins"
                                        weight: Font.Normal
                                        pixelSize: 14
                                    }
                                }
                            }
                        }
                    }
                }
                Rectangle{
                    id: loginButton
                    width: 150; height: 50;
                    color: "#323232"
                    Layout.alignment: Qt.AlignTop

                    Text {
                        id: loginButtonText
                        text: "Formu Gönder"
                        color: "white"

                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter

                        font{
                            family: 'Montserrat'
                            pixelSize: 14
                            weight: Font.Normal

                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            messageDialog.visible = true
                        }

                    }
                }
            }

            Helpers.MaterialMessageBox {
                id: messageDialog
                boxMessage: "Yaptığınız bildirim için çok teşekkürler. En kısa sürede ilgili sorun çözülecektir."
                onAccepted: {
                    mainLoader.source = "Dashboard.qml"
                }
                boxWidth: 300
                boxTitle:  "Form Kaydedildi"
                boxButtonAcceptLabel: "Tamam"
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
