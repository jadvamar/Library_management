import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

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
                        id: name
                        text: qsTr("Book Name:")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: parent.width/15
                        anchors.topMargin: parent.height/3
                        font.pixelSize: Math.min(parent.width / 3, parent.height / 3)
                    }
                    ComboBox {

                        id: comboBox
                        width: parent.width / 2
                        height: parent.height
                        x:parent.width/2

                        displayText: currentIndex === -1 ? "select":currentText
                        model:["C++","Java","Python"]
                        Component.onCompleted:currentIndex=-1

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

                            id: singleBookCount
                            text: qsTr("Single Book Count:")
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.leftMargin: parent.width/15
                            anchors.topMargin: parent.height/3
                            font.pixelSize: Math.min(parent.width / 3, parent.height / 3)

                            // Timer {
                            //     interval: 500
                            //     running: true
                            //     repeat: true
                            //     onTriggered: {
                            //         var newItemName = "Item " + (listModel.count + 1);
                            //         listModelManager.addItem(newItemName, listModel.count + 1);
                            //         var modelData = backend.getbooks()
                            //         listModel.clear(); // Clear existing items
                            //         for (var i = 0; i < modelData.length; i++) {
                            //             listModel.append(modelData[i]);
                            //         }
                            //     }
                            // }
                        }
                    }
                    Rectangle{
                        color: "#d9d1d0"
                        width: parent.width/2
                        height: parent.height
                        x:parent.width/2
                        Text {
                            id: singleBookCount1
                            //text: backend.getbooks()[comboBox.currentText]
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
                                    if (comboBox.currentIndex !== -1) {
                                        singleBookCount1.text = backend.getBookCount(comboBox.currentText);
                                    } else {
                                        singleBookCount1.text = "";
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
                        width: parent.width/2
                        height: parent.height
                        color: "#d9d1d0"
                        Text {
                            id: bookCount
                            text: qsTr("Total Book Count:")
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
                            id: bookCount1
                            text: qsTr("1")
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.rightMargin: parent.width/2
                            anchors.topMargin: parent.height/3
                            x:parent.width/2
                            font.pixelSize: Math.min(parent.width / 3, parent.height / 3)
                            // Timer {
                            //     id: updateTimer
                            //     interval: 500 // 500 milliseconds
                            //     running: true
                            //     repeat: true
                            //     onTriggered: {
                            //         // Ensure comboBox has a valid current text before fetching book count
                            //         if (comboBox.currentIndex !== -1) {
                            //             bookCount1.text = backend.getBookCount(comboBox.currentText);
                            //         } else {
                            //             bookCount1.text = "Select a book";
                            //         }
                            //     }
                            // }
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
                    Loader {
                        id: loader2
                        anchors.fill: parent
                    }
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    height: parent.height / 7
                    width: (parent.width - (spacing * 3)) / 3
                    text: "Add Books"
                    onClicked: {
                        loader2.source = "UpdateBooks.qml"
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
                    width: (parent.width - (spacing * 3)) / 3
                    text: "Assign Books"
                    onClicked: {
                        loader.source = "AssignBook.qml"
                    }
                }
                Button {
                    Loader {
                        id: loader3
                        anchors.fill: parent
                    }
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    height: parent.height / 7
                    width: (parent.width - (spacing * 3)) / 3
                    text: "Update User"
                    onClicked: {
                        loader.source = "UpdateUser.qml"
                    }
                }
            }
        }
        Rectangle {
            id: rightSideRect
            width: parent.width / 2.15
            color: "white"
            height: parent.height - 20
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.topMargin: 10
            anchors.bottomMargin: 10

            TableView {
                 anchors.fill: parent
                 columnSpacing: 1
                 rowSpacing: 1
                 clip: true

                 model: TableModel {
                     TableModelColumn { display: "name" }
                     TableModelColumn { display: "book" }
                     TableModelColumn { display: "quanitity" }

                     rows: [
                         {
                             "name": "cat",
                             "book": "black"
                         },
                         {
                             "name": "dog",
                             "book": "brown"
                         },
                         {
                             "name": "bird",
                             "book": "white"
                         }
                     ]
                 }

                 delegate: Rectangle {
                    implicitWidth: 70
                    implicitHeight: 35
                    border.width: 1

                    Text {
                        text: display
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
}


