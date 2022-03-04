import QtQuick 2.0

import "../Helpers" as Helpers

Helpers.CircleIndicator{
    idOfWidget: "CPUHeat"
    textColor: "white"
    centerTextColor: "#03E3AF"
    progressColorOfWidget: "#03E3AF"
    dialColorOfWidget: "#1D1D35"
    headerText: "CPU Sıcaklığı"
    widthOfWidget: 180
    heightOfWidget: 180
    centerSuffix: "°C"
    valueOfWidget: 60
    bottomText2: ""
    bottomText1: "CPU Sıcaklığı °C"
    attentionColorMode: true
}
