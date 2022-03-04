import QtQuick 2.0
import QtQuick.Layouts 1.2

Item{

    property string headerText: "defaultHeaderText"
    property string idOfWidget
    property int widthOfWidget: 200
    property int heightOfWidget: 200
    property int dialType: RadialBarShape.NoDial
    property string progressColorOfWidget
    property string dialColorOfWidget: "white"
    property int dialWidthOfWidget: 15
    property int valueOfWidget: 55
    property string bottomText1: "Kullanımda"
    property string bottomText2: "Kullanılmıyor"
    property string textColor: "black"
    property string centerTextColor: "black"
    property int minValueOfWidget: 0 // Alabileceği minimum değer
    property int maxValueOfWidget: 100 // Alabileceği maximum değer
    property string centerPrefix: "" // Eğer değerden sonra bir yazı veya karakter yazılacaksa Örneğin 26 kW
    property string centerSuffix: "" // Eğer değerden önce bir yazı veya karakter yazılacaksa (örneğin %26)
    property bool attentionColorMode
    property int changeStep: 10 // Artarken veya azalırken kaçar kaçar artıp azalsın

    anchors.fill: parent
    x: 20
    Text {
        text: headerText
        color:textColor
        x: parent.width / 2 - width / 2
        y: 18
        font{
            pixelSize: 14
            family: 'Montserrat'
            weight: Font.Normal
        }
    }

    Rectangle{
        id:tempId
        width: 25; height: 25
        x:30; y:30
        color: "#00000000"
        Image{
            width: parent.width;
            source: "qrc:/Assets/Images/MinusIcon.png"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(valueOfWidget - changeStep > minValueOfWidget){ //Alt değerin altına inmesi engellendi
                    decreaseAnimation.start()
                }
            }
        }
    }
    Rectangle{
        width: 25; height: 25
        y: 18
        anchors.left: tempId.right
        anchors.leftMargin: 15
        color: "#00000000"
        Image{
            width: parent.width;
            source: "qrc:/Assets/Images/PlusIcon.png"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(valueOfWidget + changeStep < maxValueOfWidget){ //Üst değeri aşması engellendi
                    increaseAnimation.start()
                }
            }
        }
    }

    RadialBarShape {

        id: idOfWidget
        width: widthOfWidget; height: heightOfWidget
        anchors.centerIn: parent
        anchors.topMargin: 20
        penStyle: Qt.RoundCap
        dialType: dialType

        /**
          * TODO: Bu yapının içinde binding loop var
          */

        /**
          *Eğer attetion modu açıksa setColor fonksiyonundan değere göre bir renk oluştur.
          *Eğer mod kapalıysa gelen rengi kullan
          **/

        progressColor: attentionColorMode? getColor(minValueOfWidget, maxValueOfWidget, valueOfWidget) : progressColorOfWidget
        dialColor: dialColorOfWidget
        dialWidth: dialWidthOfWidget
        startAngle: 220
        spanAngle: 275
        minValue: minValueOfWidget
        maxValue: maxValueOfWidget
        value: valueOfWidget
        Text{
            anchors.centerIn: idOfWidget

            /**
              *Bu fonksiyonun amacı değerler arasında giderken küsüratlı
              * sayıların tasarımı bozmasını engellemek için kullanıldı.
              */

            text: centerPrefix + valueOfWidget + centerSuffix

            color: parent.progressColor
            font {
                family: "Consolas"
                italic: false
                pointSize: 32
            }
        }
    }

    RowLayout{
        anchors.top: idOfWidget.bottom
        anchors.left: parent.left
        anchors.topMargin: 15
        anchors.leftMargin: (parent.width - width) / 2

        Rectangle{
            width: 20; height: 20
            radius: 999
            color: idOfWidget.progressColor
        }

        Text{
            text: bottomText1
            color: textColor
            font{
                pixelSize: 12
            }
        }

        Rectangle{
            width: 20; height: 20
            radius: 999
            color: idOfWidget.dialColor
            Layout.leftMargin: 30
        }

        Text{
            text: bottomText2
            color: textColor
            font{
                pixelSize: 12
            }
        }
    }

    SequentialAnimation  {
        id: increaseAnimation
        NumberAnimation { target: idOfWidget; properties: "value"; from: valueOfWidget; to: valueOfWidget + changeStep; duration: 400 }
        onStopped: {
            valueOfWidget += changeStep
            idOfWidget.progressColor = getColor(minValueOfWidget, maxValueOfWidget, valueOfWidget)
        }
    }

    SequentialAnimation  {
        id: decreaseAnimation
        NumberAnimation { target: idOfWidget; properties: "value"; from: valueOfWidget; to: valueOfWidget - changeStep; duration: 400 }
        onStopped: {
            valueOfWidget -= changeStep
            idOfWidget.progressColor = getColor(minValueOfWidget, maxValueOfWidget, valueOfWidget)
        }
    }

    /**
      *setColor fonksiyonu attentionColorMode(bool) değişkeni true değer aldığında çalışarak gönderilen değere
      *uygun bir renk geriye döndürür
      *
      * minValueOfWidget: (int)
      * maxValueOfWidget: (int)
      * valueOfWidget: (int)
      *
      **/
        function getColor(minValueOfWidget, maxValueOfWidget, valueOfWidget){

            var rate = valueOfWidget /  (maxValueOfWidget - minValueOfWidget)

            if(rate < 0.1){
                progressColorOfWidget = "#3BD429"
            }else if(rate < 0.2){
                progressColorOfWidget = "#49C62A"
            }else if(rate < 0.3){
                progressColorOfWidget = "#5BB12A"
            }else if(rate < 0.4){
                progressColorOfWidget = "#739A2A"
            }else if(rate < 0.5){
                progressColorOfWidget = "#DFCE2E"
            }else if(rate < 0.6){
                progressColorOfWidget = "#AC9C28"
            }else if(rate < 0.7){
                progressColorOfWidget = "#B18530"
            }else if(rate < 0.8){
                progressColorOfWidget = "#BA4E2C"
            }else if(rate < 0.9){
                progressColorOfWidget = "#CC3C2D"
            }else if(rate < 1){
                progressColorOfWidget = "#D7302D"
            }else{
                progressColorOfWidget = "white"
            }

            return progressColorOfWidget
        }
}


