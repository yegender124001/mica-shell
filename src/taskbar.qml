import QtQuick 2.15
import QtQuick.Controls 2.15
import Kicker 1.0
import QtQuick.Window 2.15

Rectangle {
    color:"#B2101010"
    anchors.fill: parent
    id: root
    property string accentColor : "#DA0C36"
    KickerDialog{
        id: kickerDialog
        x:0
        y:Screen.height - height - 50
        width: 815
        height: 730

    }
    Shortcut{
        sequence: "Alt+F1"
        onActivated: kickerDialog.open()
        context: Qt.ApplicationShortcut
    }
    Row{
        width: childrenRect.width
        height:parent.height
        Button{
            id: kickerMenu
            width: parent.height
            height: parent.height
            icon.source:"qrc:/start.png"
            icon.width: 18
            icon.height: 18
            onClicked: kickerDialog.open()
            icon.color: (kickerMenu.hovered | kickerDialog.visible) ? accentColor : "#CCFFFFFF"
            background: Item{
                Rectangle{
                    id: kickerBackgroundLine
                    height:4
                    width: parent.width
                    x:0
                    y:parent.height-height
                    color:kickerDialog.visible ? accentColor : "#00000000"
                }
            }
        }
        /*
        Rectangle{
            id: searchBox
            width: 350
            color:"#66101010"
            height:parent.height
            Button{
                id:searchButton
                width: parent.height
                height: parent.height
                icon.name: "stock_search"
                icon.width: 18
                icon.height: 18
                icon.color: "#CCFFFFFF"
                background: Item {}
            }
            TextField{
                id:searchText
                placeholderText: "Type here to Search"
                placeholderTextColor: "#99FFFFFF"
                color: "#ffffff"
                anchors.left: searchButton.right
                background: Item{}
                font.pixelSize: 13
                height:parent.height
                width: parent.width-searchButton.width
            }
        }*/
        Button{
            id: workspaceButton
            width: parent.height
            height: parent.height
            icon.name:"view-tasks-all-symbolic"
            icon.width: 18
            icon.height: 18
            icon.color: "#CCFFFFFF"
            background: Item{}
        }
        Rectangle{
            id:seprator1
            height:28
            width: 1
            color:"#33ffffff"
            x:1
            anchors.verticalCenter: workspaceButton.verticalCenter
        }
        Row{
            height:parent.height
            width: childrenRect.width
            spacing: 1
            Repeater{
                model:["chrome","org.kde.dolphin","kmail","org.kde.discover"]
                Button{
                    id: taskButton
                    icon.name: modelData
                    icon.color: "transparent"
                    icon.width: 24
                    icon.height: 24
                    background: Item{}
                    width: parent.height
                    height: parent.height
                }
            }
        }
    }
    Rectangle{
        width:15
        height:parent.height
        color:"#66101010"
        anchors.right: parent.right
        id: showDesktop
    }
    Button{
        width: parent.height
        height: parent.height
        background: Item{}
        icon.name: "menu_new"
        icon.width: 48
        icon.height: 48
        icon.color:"white"
        anchors.right: showDesktop.left
        id: actionCenter
    }
    Button{
        height:parent.height
        font.pixelSize: 13
        palette.buttonText:"#CCFFFFFF"
        Text{
            id: timeText
            text:Qt.formatDateTime(new Date(),"hh:mm A\ndd/MM/yy")
            anchors.centerIn: parent
            color:"white"
            font.family: "Segoe UI"
            function set(){
                text=Qt.formatDateTime(new Date(),"hh:mm A\ndd/MM/yy")
            }

            Timer {
                interval: 1000
                repeat: true
                running: true
                triggeredOnStart: true
                onTriggered: timeText.set()
            }
        }
        width: timeText.width
        background: Item{}
        anchors.right: actionCenter.left
        anchors.rightMargin: 5
        id: dateTime
    }


}
