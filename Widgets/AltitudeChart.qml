import QtQuick 2.0
import QtCharts 2.2

Item {
    ChartView {
        title: "Günlük Ortalama Rakım Değerleri"
        anchors.fill: parent
        legend.alignment: Qt.AlignBottom
        antialiasing: true

        StackedBarSeries {
            id: mySeries
            axisX: BarCategoryAxis { categories: ["14-08-2021","15-08-2021", "16-08-2021", "17-08-2021" , "18-08-2021", "19-08-2021"] }
            BarSet { label: "Günlük Rakım Ortalaması"; values: [1210, 1240, 1200, 1180, 1260, 1120] }
        }
    }
}
