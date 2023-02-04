import QtQuick 2.15
import QtQuick.Controls 2.15
Rectangle{
    width: 50
    height: parent.height
    color:"#CC101010"
    id:sideBar
    clip: true
    states:[
        State{
            name:"normal"
            when:hover.hovered == false
            PropertyChanges{
                target: sideBar
                width: 50
            }
        },
        State{
            name:"expanded"
            when:hover.hovered == true
            PropertyChanges {
                target: sideBar
                width: 300
                color:"#101010"
            }
        }
    ]
    transitions: Transition {
        reversible:true
        ParallelAnimation {
            NumberAnimation { properties: "width"; duration: 200; easing.type: Easing.InOutCubic }
            ColorAnimation { duration: 200 }
        }
    }

    HoverHandler{
        id:hover
    }
    Column{
        width: 300
        height:parent.height
        Button{
            width: parent.width
            height: 50
            Button{
                width: 50
                height: 50
                icon.name:"menu_new"
                icon.color: "white"
                icon.width: 48
                icon.height: 48
                onClicked:parent.onClicked()
                background: Item{}
            }
            Label{
                text:"Start"
                font.family: fontFamily
                font.bold: true
                font.pixelSize: 17
                color:"white"
                anchors.verticalCenter: parent.verticalCenter
                x:60
            }
            background: Item {}
        }
        Button{
            width: parent.width
            height: 50
            background: Item {}
            Button{
                onClicked:parent.onClicked()
                width: 50
                Rectangle{
                    width: 18
                    height: 18
                    radius: height
                    anchors.centerIn: parent
                }

                background: Item{}
                height: 50
            }
            Label{
                text:"%accountname%"
                font.pixelSize: 17
                font.family: fontFamily
                color:"white"
                anchors.verticalCenter: parent.verticalCenter
                x:60
            }
        }
        Item{
            width: parent.width
            height:parent.height-(6*50)
        }
        Button{
            width: parent.width
            height: 50
            background: Item {}
            Button{
                width: 50
                onClicked:parent.onClicked()
                height: 50
                icon.name:"computer-laptop-symbolic"
                icon.color: "white"
                icon.width: 18
                icon.height: 18
                background: Item{}
            }
            Label{
                text:"This PC"
                font.pixelSize: 17
                font.family: fontFamily
                color:"white"
                anchors.verticalCenter: parent.verticalCenter
                x:60
            }
        }
        Button{
            width: parent.width
            height: 50
            background: Item {}
            Button{
                width: 50
                onClicked:parent.onClicked()
                height: 50
                icon.name:"folder"
                icon.color: "white"
                icon.width: 18
                icon.height: 18
                background: Item{}
            }
            Label{
                text:"Dolphin"
                font.pixelSize: 17
                font.family: fontFamily
                color:"white"
                anchors.verticalCenter: parent.verticalCenter
                x:60
            }
        }
        Button{
            width: parent.width
            height: 50
            background: Item {}
            Button{
                background: Item {}
                onClicked:parent.onClicked()
                width: 50
                height: 50
                icon.name:"system-settings-symbolic"
                icon.color: "white"
                icon.width: 18
                icon.height: 18
            }
            Label{
                text:"Settings"
                font.pixelSize: 17
                font.family: fontFamily
                color:"white"
                anchors.verticalCenter: parent.verticalCenter
                x:60
            }
        }
        Button{
            width: parent.width
            height: 50
            background: Item {}
            Button{
                onClicked:parent.onClicked()
                width: 50
                height: 50
                icon.name:"system-shutdown-symbolic"
                icon.color: "white"
                icon.width: 18
                background: Item {}
                icon.height: 18
            }
            Label{
                text:"Power"
                font.pixelSize: 17
                font.family: fontFamily
                color:"white"
                anchors.verticalCenter: parent.verticalCenter
                x:60
            }
        }
    }
}
