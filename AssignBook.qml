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
        text: qsTr("Library Management")
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
                    color: "#d9d1d0"
                    width: parent.width - 10
                    height: parent.height / 7
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    Text {
                        id: userNameTxt
                        text: qsTr("User Name:")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: parent.width/15
                        anchors.topMargin: parent.height/3
                        font.pixelSize: Math.min(parent.width / 3, parent.height / 3)
                    }
                    ComboBox {

                        id: userComboBox
                        width: parent.width / 2
                        height: parent.height
                        x:parent.width/2

                        model: ListModel {
                            ListElement { name: "Amar" }
                            ListElement { name: "Tanmay" }
                            ListElement { name: "Ram" }
                        }

                        delegate: Item {
                            width: comboBox.width
                            height: 40

                            Rectangle {
                                width: parent.width
                                height: parent.height
                                color: "white"
                                border.color: "gray"
                                radius: 5

                                Text {
                                    anchors.centerIn: parent
                                    text: model.name
                                }
                            }
                        }

                        onCurrentIndexChanged: {
                            console.log("Selected item:", model.get(currentIndex).name)
                        }
                    }
                    Timer {
                        interval: 500
                        running: true
                        repeat: true
                        onTriggered: {
                            var newItemName = "Item " + (listModel.count + 1);
                            listModelManager.addItem(newItemName, listModel.count + 1);
                            var modelData = listModelManager.getModel();
                            listModel.clear(); // Clear existing items
                            for (var i = 0; i < modelData.length; i++) {
                                listModel.append(modelData[i]);
                            }
                        }
                    }
                }
                Rectangle {
                    color: "#d9d1d0"
                    width: parent.width - 10
                    height: parent.height / 7
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    Text {
                        id: bookNameLable
                        text: qsTr("Book Name:")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: parent.width/15
                        anchors.topMargin: parent.height/3
                        font.pixelSize: Math.min(parent.width / 3, parent.height / 3)
                    }
                    ComboBox {

                        id: bookComboBox
                        width: parent.width / 2
                        height: parent.height
                        x:parent.width/2
                        font.pixelSize: 17
                        displayText: currentIndex === -1 ? "select":currentText
                        model:["C++","Java","Python"]
                        Component.onCompleted:currentIndex=-1
                        onCurrentIndexChanged: {
                            console.log("Selected item:", model.get(currentIndex).name)
                        }
                    }
                }
                Rectangle {
                    color: "#d9d1d0"
                    width: parent.width - 10
                    height: parent.height / 7
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    Rectangle{
                        width: parent.width/2
                        height: parent.height
                        color: "#d9d1d0"
                        Text {
                            id: bookCountLable
                            text: qsTr("Total Available Book:")
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.leftMargin: parent.width/15
                            anchors.topMargin: parent.height/3
                            font.pixelSize: Math.min(parent.width / 3, parent.height / 3)
                        }
                    }
                    Rectangle{
                        width: parent.width/2
                        height: parent.height
                        x:parent.width/2
                        color: "#d9d1d0"
                        Text {
                            id: bookCountTxt
                            text: qsTr("1")
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.rightMargin: parent.width/2
                            anchors.topMargin: parent.height/3
                            x:parent.width/2
                            font.pixelSize: Math.min(parent.width / 3, parent.height / 3)
                            Timer {
                                id: updateTimer
                                interval: 500 // 500 milliseconds
                                running: true
                                repeat: true
                                onTriggered: {
                                    // Ensure comboBox has a valid current text before fetching book count
                                    if (bookComboBox.currentIndex !== -1) {
                                        bookCountTxt.text = backend.getBookCount(bookComboBox.currentText);
                                    } else {
                                        bookCountTxt.text = "";
                                    }
                                }
                            }

                        }
                    }
                }
                Rectangle {
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

                            id: quantityLable
                            text: qsTr("Quantity:")
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.leftMargin: parent.width/15
                            anchors.topMargin: parent.height/3
                            font.pixelSize: Math.min(parent.width / 3, parent.height / 3)
                        }
                    }
                    Rectangle{
                        color: "#d9d1d0"
                        width: parent.width/2
                        height: parent.height
                        x:parent.width/2
                        border.color: "black"
                        TextInput {
                            id: quantityInput
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
                            validator: IntValidator { bottom: 0 }
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
                    text: "Assign"
                    onClicked: {
                        myCppObject.doSomething()
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
                    text: "Remove"
                    onClicked: {
                        loader.source = "AssignBook.qml"
                    }
                }
            }
        }
    }
}



