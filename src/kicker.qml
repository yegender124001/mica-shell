import QtQuick 2.15
import QtQuick.Controls 2.15

Item{
    anchors.fill: parent
    property string fontFamily : "Segoe UI"
    Rectangle{
        width: 350
        x:50
        height: parent.height-50
        color:"#B2101010"
        y:50
        id:applicationBar
    }
    Rectangle{
        width: 730
        anchors.left: applicationBar.right
        color:"#99101010"
        height:parent.height
        id:tiles
    }
    Rectangle{
        id: searchBox
        width: 350
        color:"#66101010"
        height:50
        x:50
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
            font.family: fontFamily
            width: parent.width-searchButton.width
        }
    }
    SideBar{
        id:sideBar
    }
}
