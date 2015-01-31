import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: lockScreen
    Item{
        id: weatherData
        property QtObject meecastData 
        property bool active: true
        visible: true
        Component.onCompleted: {
            meecastData = Qt.createQmlObject('import QtQuick 2.0; import org.meecast.data 1.0 as Meecast; Meecast.Data {}', weatherData)
        }
        anchors {
            top: networkNameAndDateLabels.bottom
            topMargin: Theme.paddingMedium
            right: parent.right
            rightMargin: Theme.paddingMedium
        }
        width: 415
        height: 140  

        Rectangle {
            id: background
            anchors.fill: parent
            color: "grey"
            opacity: 0.3
            radius: 1
        }

        Rectangle {
            id: background_border
            anchors.left: parent.left
            anchors.fill: parent
            border.color: "silver"
            border.width: 1
            color: "transparent"
            radius: 1
        }

        Rectangle {
            id: first_item 
            anchors.left: parent.left
            color: "transparent"
            width: parent.height 
            height: parent.height 

            Image {
                id: icon_1
                source: weatherData.meecastData.forecastdata["item1_icon"]
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                opacity: 0.4
                height: parent.height - Theme.paddingSmall
                width: parent.height - Theme.paddingSmall
            }

            Label {
                id: temperature_1 
                anchors.top: parent.top
                anchors.topMargin: -Theme.paddingSmall
                color: "white"
                width: parent.width - Theme.paddingSmall
                font.pixelSize: Theme.fontSizeExtraLarge + 5
                horizontalAlignment: Text.AlignHCenter
                text: {
                    if (weatherData.meecastData.forecastdata["item1_temperature"] && weatherData.meecastData.forecastdata["item1_temperature"] != "N/A"){
                        return weatherData.meecastData.forecastdata["item1_temperature"] + '°' + weatherData.meecastData.forecastdata["temperatureunit"]
                    }else{
                        return temperature_1.text = weatherData.meecastData.forecastdata["item1_temperature_low"] +  '°' + weatherData.meecastData.forecastdata["temperatureunit"] + "\n"+  weatherData.meecastData.forecastdata["item1_temperature_high"] + '°' + weatherData.meecastData.forecastdata["temperatureunit"]
                    }
                }
            }
        }
        Rectangle {
            id: second_item 
            anchors.left: first_item.right
            anchors.bottom: background.bottom
            color: "transparent"
            width: parent.height*2/3
            height: parent.height*2/3

            Image {
                id: icon_2
                source: weatherData.meecastData.forecastdata["item2_icon"]
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: 1.0 
                height: weatherData.height/2 
                width: weatherData.height/2 

            }
            Label {
                id: day_name_2 
                anchors.bottom: icon_2.top 
                anchors.bottomMargin: -Theme.paddingSmall
                color: "white"
                font.pixelSize: Theme.fontSizeMedium/2 
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                text: weatherData.meecastData.forecastdata["item2_short_day_name"]
            }
            Label {
                id: temperature_2 
                anchors.bottom: parent.bottom
                color: "white"
                font.pixelSize: Theme.fontSizeExtraSmall - 3
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                text: {
                    if ( weatherData.meecastData.forecastdata["item2_temperature_high"] == "N/A" || weatherData.meecastData.forecastdata["item2_temperature_low"] == "N/A" ){   
                        return temperature_2.text = weatherData.meecastData.forecastdata["item2_temperature"] + '°' + weatherData.meecastData.forecastdata["temperatureunit"]
                    }else{
                        return weatherData.meecastData.forecastdata["item2_temperature_low"] + "/"+  weatherData.meecastData.forecastdata["item2_temperature_high"]  + '°' + weatherData.meecastData.forecastdata["temperatureunit"]
                    }
                }
            }

        }
        Rectangle {
            id: thrid_item 
            anchors.left: second_item.right
            anchors.bottom: background.bottom
            color: "transparent"
            width: parent.height*2/3
            height: parent.height*2/3

            Image {
                id: icon_3
                source: weatherData.meecastData.forecastdata["item3_icon"]
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: 1.0 
                height: weatherData.height/2 
                width: weatherData.height/2 
            }
            Label {
                id: day_name_3 
                anchors.bottom: icon_3.top 
                anchors.bottomMargin: -Theme.paddingSmall
                color: "white"
                font.pixelSize: Theme.fontSizeMedium/2 
                horizontalAlignment: Text.AlignHCenter
                text: weatherData.meecastData.forecastdata["item3_short_day_name"]
                width: parent.width
            }
            Label {
                id: temperature_3
                anchors.bottom: parent.bottom
                color: "white"
                font.pixelSize: Theme.fontSizeExtraSmall - 3 
                horizontalAlignment: Text.AlignHCenter
                text: weatherData.meecastData.forecastdata["item3_temperature"] + '°'+ weatherData.meecastData.forecastdata["temperatureunit"]
                width: parent.width
            }
        }
        Rectangle {
            id: forth_item 
            anchors.left: thrid_item.right
            anchors.bottom: background.bottom
            color: "transparent"
            width: parent.height*2/3
            height: parent.height*2/3

            Image {
                id: icon_4
                source: weatherData.meecastData.forecastdata["item4_icon"]
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: 1.0 
                height: weatherData.height/2 
                width: weatherData.height/2 
            }
            Label {
                id: day_name_4
                anchors.bottom: icon_4.top
                anchors.bottomMargin: -Theme.paddingSmall
                color: "white"
                font.pixelSize: Theme.fontSizeMedium/2 
                horizontalAlignment: Text.AlignHCenter
                text: weatherData.meecastData.forecastdata["item4_short_day_name"]
                width: parent.width
            }
            Label {
                id: temperature_4
                anchors.bottom: parent.bottom
                color: "white"
                font.pixelSize: Theme.fontSizeExtraSmall - 3
                horizontalAlignment: Text.AlignHCenter
                text: weatherData.meecastData.forecastdata["item4_temperature"] + '°'+ weatherData.meecastData.forecastdata["temperatureunit"]
                width: parent.width
            }
        }

        Rectangle{
            id: header_rect 
            anchors.right: parent.right
            anchors.top: parent.top
            height: parent.height*1/4
            color: "transparent"
            width: parent.width - first_item.width 
            Label {
                id: station_name 
                height: parent.height
                anchors.right: last_update.left
                anchors.rightMargin: Theme.paddingSmall
                anchors.left: parent.left
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: weatherData.meecastData.nameString 
                font.pixelSize: Theme.fontSizeExtraSmall
            }
            Label {
                id: last_update 
                height: parent.height
                anchors.right: parent.right
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: Theme.paddingSmall
                text: weatherData.meecastData.forecastdata["last_update"]
                font.pixelSize: Theme.fontSizeExtraSmall - 5
            }
        }
        Connections {
            target: weatherData.meecastData 
            onRefreshWidget: {            
                console.log("Refresh widget !!!!!!!!!!!!!!")
                station_name.text = weatherData.meecastData.nameString 
                last_update.text = weatherData.meecastData.forecastdata["last_update"]
                if (weatherData.meecastData.forecastdata["item1_temperature"] && weatherData.meecastData.forecastdata["item1_temperature"] != "N/A"){
                    temperature_1.text = weatherData.meecastData.forecastdata["item1_temperature"] + '°' + weatherData.meecastData.forecastdata["temperatureunit"]
                }else{
                     temperature_1.text = weatherData.meecastData.forecastdata["item1_temperature_low"] +  '°' + weatherData.meecastData.forecastdata["temperatureunit"] + "\n"+  weatherData.meecastData.forecastdata["item1_temperature_high"] + '°' + weatherData.meecastData.forecastdata["temperatureunit"]
                }

                if ( weatherData.meecastData.forecastdata["item2_temperature_high"] == "N/A" || weatherData.meecastData.forecastdata["item2_temperature_low"] == "N/A" ){   
                    temperature_2.text = weatherData.meecastData.forecastdata["item2_temperature"] + '°' + weatherData.meecastData.forecastdata["temperatureunit"]
                }else{
                    temperature_2.text = weatherData.meecastData.forecastdata["item2_temperature_low"] + "/"+  weatherData.meecastData.forecastdata["item2_temperature_high"]  + '°' + weatherData.meecastData.forecastdata["temperatureunit"]
                }

                if ( weatherData.meecastData.forecastdata["item3_temperature_high"] == "N/A" || weatherData.meecastData.forecastdata["item3_temperature_low"] == "N/A" ){   
                    temperature_3.text = weatherData.meecastData.forecastdata["item3_temperature"] + '°' + weatherData.meecastData.forecastdata["temperatureunit"]
                }else{
                    temperature_3.text = weatherData.meecastData.forecastdata["item3_temperature_low"] + "/"+  weatherData.meecastData.forecastdata["item3_temperature_high"]  + '°' + weatherData.meecastData.forecastdata["temperatureunit"]
                }
 
                if ( weatherData.meecastData.forecastdata["item4_temperature_high"] == "N/A" || weatherData.meecastData.forecastdata["item4_temperature_low"] == "N/A" ){   
                    temperature_4.text = weatherData.meecastData.forecastdata["item4_temperature"] + '°' + weatherData.meecastData.forecastdata["temperatureunit"]
                }else{
                    temperature_4.text = weatherData.meecastData.forecastdata["item4_temperature_low"] + "/"+  weatherData.meecastData.forecastdata["item4_temperature_high"]  + '°' + weatherData.meecastData.forecastdata["temperatureunit"]
                }
                
                icon_1.source = weatherData.meecastData.forecastdata["item1_icon"]
                icon_2.source = weatherData.meecastData.forecastdata["item2_icon"]
                icon_3.source = weatherData.meecastData.forecastdata["item3_icon"]
                icon_4.source = weatherData.meecastData.forecastdata["item4_icon"]
                day_name_2.text = weatherData.meecastData.forecastdata["item2_short_day_name"]
            }
        }
    }

}
