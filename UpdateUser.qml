import QtQuick
import QtQuick.Controls

Window {
    id: mainWindow
    width: 850
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "#d9d1d0"

    Text {
        id: heading
        text: qsTr("Update User")
        font.pixelSize: 23
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        color: "black"
        anchors.topMargin: 20
    }
    Rectangle{
        id: innerFrame
        width: mainWindow.width
        height: mainWindow.height
        border.color: "#c7c1c1"
        color: "#d9d1d0"
        border.width: 2
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 60
        anchors.bottomMargin: 10

        Rectangle {
            id: leftSideRect
            color: "#d9d1d0"
            width: parent.width / 2
            height: parent.height - 20
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 10
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            Column {
                anchors.fill: parent
                spacing: 10
                Rectangle {
                    id: lable
                    color: "#d9d1d0"
                    width: parent.width - 10
                    height: parent.height / 7
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    Rectangle{
                        color: "#d9d1d0"
                        width: parent.width/2
                        height: parent.height
                        Text {

                            id: singleBookCount2
                            text: qsTr("User Name:")
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.leftMargin: parent.width/15
                            anchors.topMargin: parent.height/3
                            font.pixelSize: Math.min(parent.width / 3, parent.height / 3)
                        }
                    }
                    Rectangle{
                        id: inputRectangle
                        color: "#d9d1d0"
                        width: parent.width/2
                        height: parent.height
                        x:parent.width/2
                        border.color: "black"
                        TextInput {
                            id: userNameInput
                            anchors.right: parent.right
                            anchors.left: parent.left
                            anchors.fill: parent
                            anchors.top: parent.top

                            anchors.rightMargin: parent.width / 2
                            anchors.leftMargin: 10
                            anchors.topMargin: parent.height / 3

                            width: parent.width / 2
                            height: parent.height / 10

                            font.pixelSize: Math.min(parent.width / 3, parent.height / 3)
                            color: "black" // Text color
                            //validator: IntValidator { bottom: 0 }
                        }
                    }
                }
            }
            Row {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.fill: parent
                anchors.margins: 15
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    height: parent.height / 7
                    width: (parent.width - (spacing * 3)) / 2
                    text: "Add"
                    onClicked: {
                       backend.setUser(userNameInput.text);
                    }
                }
                Button {
                    Loader {
                        id: loader
                        anchors.fill: parent
                    }
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    height: parent.height / 7
                    width: (parent.width - (spacing * 3)) / 2
                    text: "Delete"
                    onClicked: {
                        backend.deleteUser(userNameInput.text);
                    }
                }
            }
        }
    }
}
