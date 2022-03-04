import QtQuick 2.0
import QtQuick.Layouts 1.2

import "../Helpers" as Helpers

Helpers.CircleIndicator{
    id: tempId
    idOfWidget: "ramUsageWidget"
    textColor: "white"
    centerTextColor: "#03E3AF"
    dialColorOfWidget: "#16172E"
    headerText: "RAM Kullanımı"
    centerPrefix: "%"
    valueOfWidget: 11
    widthOfWidget: 180
    heightOfWidget: 180
    minValueOfWidget: 0
    maxValueOfWidget: 100
    attentionColorMode: true
}

