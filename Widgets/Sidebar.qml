import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    id: sideBarItem
    property string activePage

    Image{
        id: sidebar
        source: "qrc:/Assets/Images/sidebar.png"
        Layout.preferredHeight: parent.height
        Layout.preferredWidth: parent.width
        y: parent.height / 2 - height / 2
        z:1

        ColumnLayout{
            width : 100
            Layout.fillWidth: parent.width
            Item{
                width :100
                height: homeButton.height + homeButtonText. height
                Layout.topMargin: activePage === "dashboard"? 60 : 75
                Layout.alignment: Qt.AlignCenter
                Image{
                    id: homeButton
                    anchors{
                        left: parent.left
                        leftMargin: activePage === "dashboard"? 10 : 25
                    }
                    source: activePage === "dashboard"? "qrc:/Assets/Images/SidebarIcons/HomeIconActive.png" : "qrc:/Assets/Images/SidebarIcons/HomeIcon.png"
                }
                Text{
                    id: homeButtonText
                    text: "Anasayfa"
                    color: "white"
                    font{
                        family: 'Montserrat'
                        pixelSize: 12
                        weight: Font.Normal
                    }
                    anchors{
                        top: homeButton.bottom
                        left: parent.left
                        topMargin: 10
                        leftMargin: (parent.width - width) / 2
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        mainLoader.source = "qrc:/Screens/Dashboard.qml"
                    }
                }
            }

            Item{
                width :100
                height: systemInfoButton.height + systemInfoButtonText. height
                Layout.topMargin: activePage === "system"? 60 : 75
                Layout.alignment: Qt.AlignCenter


                Image{
                    id: systemInfoButton
                    anchors{
                        left: parent.left
                        leftMargin: activePage === "system"? 10 : 25
                    }
                    source: activePage === "system"? "qrc:/Assets/Images/SidebarIcons/SystemInfoIconActive.png" : "qrc:/Assets/Images/SidebarIcons/SystemInfoIcon.png"
                }
                Text{
                    id: systemInfoButtonText
                    text: "Sistem Bilgisi"
                    color: "white"
                    font{
                        family: 'Montserrat'
                        pixelSize: 12
                        weight: Font.Normal
                    }
                    anchors{
                        top: systemInfoButton.bottom
                        left: parent.left
                        topMargin: 10
                        leftMargin: (parent.width - width) / 2
                    }
                }
                MouseArea{
                    anchors.fill: parent

                    onClicked: {
                        mainLoader.source = "qrc:/Screens/SystemInformation.qml"
                    }
                }
            }
            Item{
                width :100
                height: envInfoButton.height + envInfoButtonText. height
                Layout.topMargin: activePage === "env"? 60 : 75

                Layout.alignment: Qt.AlignCenter
                Image{
                    id: envInfoButton
                    anchors{
                        left: parent.left
                        leftMargin: activePage === "env"? 10 : 25
                    }
                    source:activePage ==="env"? "qrc:/Assets/Images/SidebarIcons/EnvInfoIconActive.png": "qrc:/Assets/Images/SidebarIcons/EnvInfoIcon.png"
                }
                Text{
                    id: envInfoButtonText
                    text: "Çevre Bilgisi"
                    color: "white"
                    font{
                        family: 'Montserrat'
                        pixelSize: 12
                        weight: Font.Normal
                    }
                    anchors{
                        top: envInfoButton.bottom
                        left: parent.left
                        topMargin: 10
                        leftMargin: (parent.width - width) / 2
                    }

                }
                MouseArea{
                    anchors.fill: parent

                    onClicked: {
                        mainLoader.source = "qrc:/Screens/EnvironmentInformation.qml"
                    }
                }
            }
            Item{
                width :100
                height: errorStatementButton.height + errorStatementButtonText. height
                Layout.topMargin: activePage === "error"? 60 : 75
                Layout.alignment: Qt.AlignCenter

                Image{
                    id: errorStatementButton
                    anchors{
                        left: parent.left
                        leftMargin: activePage === "error"? 10 : 25
                    }
                    source: activePage === "error"? "qrc:/Assets/Images/SidebarIcons/ErrorFormIconActive.png" : "qrc:/Assets/Images/SidebarIcons/ErrorFormIcon.png"
                }
                Text{
                    id: errorStatementButtonText
                    text: "Hata Bildir"
                    color: "white"
                    font{
                        family: 'Montserrat'
                        pixelSize: 12
                        weight: Font.Normal
                    }
                    anchors{
                        top: errorStatementButton.bottom
                        left: parent.left
                        topMargin: 10
                        leftMargin: (parent.width - width) / 2
                    }
                }
                MouseArea{
                    anchors.fill: parent

                    onClicked: {
                        mainLoader.source = "qrc:/Screens/ErrorStatement.qml"
                    }
                }
            }

            Item{
                width :100
                height: logoutButton.height + logoutButtonButtonText. height
                Layout.topMargin: 60
                Layout.alignment: Qt.AlignCenter

                Image{
                    id: logoutButton
                    anchors{
                        left: parent.left
                        leftMargin: 25
                    }
                    source: "qrc:/Assets/Images/SidebarIcons/LogoutIcon.png"
                }
                Text{
                    id: logoutButtonButtonText
                    text: "Çıkış Yap"
                    color: "white"
                    font{
                        family: 'Montserrat'
                        pixelSize: 12
                        weight: Font.Normal
                    }

                    anchors{
                        top: logoutButton.bottom
                        left: parent.left
                        topMargin: 10
                        leftMargin: (parent.width - width) / 2
                    }

                }

                MouseArea{
                    anchors.fill: parent

                    onClicked: {
                        mainLoader.source = "qrc:/Screens/LoginScreen.qml"
                    }
                }

            }
        }
    }
}
