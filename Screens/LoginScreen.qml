import QtQuick 2.0
import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import "../Helpers/md5.js" as MD5
import "../Helpers/" as Helpers

Rectangle{
    color: "#DDDDDD"
    width: root.width; height: root.height
    Rectangle{
        id: backgroundOfCard
        color: "white"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        width: root.width * 0.85; height: root.height * 0.75
        radius: 10
        clip: true

        RowLayout{
            id: rowLayout
            spacing: 0

            Image{
                id: teiImage
                source: "qrc:/Assets/Images/TeiGraphicView.png"
                width:  0.41 * backgroundOfCard.width
                height: backgroundOfCard.height
                Layout.preferredWidth: 0.40 * backgroundOfCard.width
            }

            ColumnLayout{
                id: infosSection
                Layout.preferredWidth: 0.60 * backgroundOfCard.width
                Layout.preferredHeight: backgroundOfCard.height * 0.8

                Layout.alignment: Qt.AlignHCenter
                Layout.leftMargin: 80
                spacing: 0
                y:0

                Text {
                    id: loginText
                    text: qsTr("Giriş Yap")
                    font{
                        pixelSize: 36
                        family: 'Montserrat'
                    }
                }

                Text {
                    id: descriptionText
                    Layout.topMargin: -40
                    Layout.bottomMargin: 40

                    text: qsTr("Lütfen sistem için size özel verilmiş bilgileri giriniz.")
                    font{
                        pixelSize: 12
                        family: 'Montserrat'
                        weight: Font.Light
                    }
                }

                Text {
                    id: emailText
                    Layout.bottomMargin: -20

                    text: qsTr("E-POSTA ADRESİNİZ")
                    font{
                        pixelSize: 12
                        family: 'Montserrat'
                        weight: Font.Bold
                    }


                }

                Rectangle{
                    id: emailRect

                    Layout.bottomMargin: -10

                    width: 318; height: 45
                    border{
                        color: "#D2D2D2"
                        width: 1
                    }

                    RowLayout{
                        id: rectLayout
                        Layout.preferredWidth: parent.width


                        Image{
                            id: emailIcon
                            width: 24; height: 24
                            source: "qrc:/Assets/Images/envelope.png"
                            Layout.leftMargin: 5
                        }

                        TextField{
                            id: usernameTextField
                            placeholderText: "test@tei.com.tr"

                            style: TextFieldStyle {
                                font{
                                    family: "Poppins"
                                    pixelSize: 13
                                    weight: Font.Normal
                                }

                                textColor: "black"
                                background: Rectangle {
                                    implicitWidth: 285
                                    implicitHeight: 45
                                    border.color: "#D2D2D2"
                                    border.width: 1
                                }
                                placeholderTextColor: "#858585"
                            }


                        }


                    }

                }

                Text {
                    id: passwordText
                    Layout.bottomMargin: -40

                    text: qsTr("ŞİFRENİZ")
                    font{
                        pixelSize: 12
                        family: 'Montserrat'
                        weight: Font.Bold
                    }

                }
                Rectangle{

                    id: passwordRect

                    width: 318; height: 45
                    border{
                        color: "#D2D2D2"
                        width: 1
                    }

                    RowLayout{
                        id: passwordLayout
                        Layout.preferredWidth: parent.width

                        Image{
                            id: passwordIcon
                            width: 24; height: 24
                            source: "qrc:/Assets/Images/key.png"
                            Layout.leftMargin: 5
                        }
                        TextField{
                            id: passwordTextField
                            placeholderText: "•••••••••"

                            echoMode: seePasswordIcon.showPasswordClicked? TextInput.Normal : TextInput.Password
                            style: TextFieldStyle {

                                font{
                                    family: "Poppins"
                                    pixelSize: 13
                                    weight: Font.Normal
                                }
                                textColor: "black"
                                background: Rectangle {
                                    implicitWidth: 285
                                    implicitHeight: 45
                                    border.color: "#D2D2D2"
                                    border.width: 1
                                }
                                placeholderTextColor: "#858585"
                            }
                        }


                        Image{
                            id: seePasswordIcon
                            width: 24; height: 24
                            Layout.leftMargin: -40
                            property bool showPasswordClicked: false
                            source: showPasswordClicked ?  "qrc:/Assets/Images/dontShowPass.png"  : "qrc:/Assets/Images/showPass.png"
                            MouseArea{
                                anchors{
                                    fill: parent
                                }
                                onClicked: {
                                    parent.showPasswordClicked = !parent.showPasswordClicked
                                }
                            }
                        }

                    }


                }

                CheckBox{
                    id: rememberMeCheckBox

                    Layout.topMargin: -40
                    Layout.bottomMargin: 45
                    style: CheckBoxStyle{
                        indicator: Rectangle {
                            id: indicatorRect
                            implicitWidth: 22
                            implicitHeight: 22
                            y: parent.height / 2 - height / 2
                            border.color: "#222222"
                            border.width: 3

                            Text {
                                width: 15
                                height: 15
                                text: "◼"
                                y: -5
                                x:2
                                font.pointSize: 16
                                color: "#222222"
                                visible: control.checked
                            }
                        }

                        label: Text {
                            text: " Beni Hatırla"
                            font.pixelSize: 12
                            font.family: 'Poppins'
                            color:"#222222"
                            font.weight: Font.Bold
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
                        text: qsTr("GİRİŞ YAP")
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
                            var username = usernameTextField.getText(0, usernameTextField.displayText.length)
                            var password = passwordTextField.getText(0, passwordTextField.displayText.length)
                            var cryptedText = MD5.md5(username+password)

                            if(cryptedText === "651f976d518ac63f02b6bdc6d54ef1ff"){
                                mainLoader.source = "Dashboard.qml"
                            }else{
                                msgBoxId.visible = true
                            }
                        }
                    }
                }
            }
        }
    }

    Helpers.MaterialMessageBox {
        id: msgBoxId
        boxMessage: "E-Posta adresiniz veya şifreniz hatalı. Lütfen kontrol  edip tekrardan deneyiniz."
        onAccepted: {
            passwordTextField.remove(0, passwordTextField.displayText.length)
        }
        boxWidth: 290
        boxTitle: "Giriş Başarısız"
        boxButtonAcceptLabel: "Tamam"
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



