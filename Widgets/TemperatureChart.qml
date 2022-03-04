import QtQuick 2.0
import QtCharts 2.15

Item {

    width: 700; height: 250
    ChartView {
        title: "Farklı Sensörlerden Gelen Ortalama Sıcaklık Değerleri (°C)"
        anchors.fill: parent
        legend.alignment: Qt.AlignBottom
        antialiasing: true

        BarSeries {
            id: mySeries
            axisX: BarCategoryAxis { categories: ["13.08.2021", "14.08.2021", "15.08.2021", "16.08.2021", "17.08.2021", "18.08.2021"] }
            BarSet { label: "İç Ortam Sensörü"; values: [28, 26, 27, 27, 28, 25] }
            BarSet { label: "Dış Ortam Sensörü"; values: [24, 23, 26, 25, 24, 22] }
            BarSet { label: "Tavan Sensörü"; values: [29, 27, 28, 29, 30, 26] }
        }
    }
}
