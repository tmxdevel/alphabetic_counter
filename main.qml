import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import ssa.io 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Частотный словарь")

    readonly property color bgColor: "#DADAD9"

    Parser {
        id: parser
        inputText: inputArea.text
    }

    Rectangle {
        id: root

        color: bgColor

        anchors.fill: parent

        FileExplorerRow {
            id: fileExplorer
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: parent.right

            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 10


        }

        Rectangle {
            color: "#404244"

            anchors.top: fileExplorer.bottom

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.leftMargin: 20

            anchors.bottom: saveButton.top
            anchors.bottomMargin: 20

            Rectangle {
                id: inputTextWrap
                color: "#DADAD9"

                anchors.left: parent.left
                anchors.leftMargin: 10

                anchors.right: parent.right
                anchors.rightMargin: parent.width*0.25 + 5

                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10

                ScrollView {
                    anchors.fill: parent
                    clip: true
                    TextEdit {
                        id: inputArea
                        anchors.fill: parent
                        padding: 4

                        wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere

                        text: fileExplorer.fileContent
                    }
                }
            }

            Rectangle {
                id: outputWrap
                color: "#DADAD9"

                anchors.right: parent.right
                anchors.rightMargin: 10

                anchors.left: parent.left
                anchors.leftMargin: parent.width*0.75 + 5

                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                ScrollView {
                    anchors.fill: parent
                    clip: true
                    TextEdit {
                        id: outputArea
                        anchors.fill: parent
                        padding: 4

                        wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere

                        text: parser.outputText
                    }
                }

            }

        }

        Button {
            id: saveButton
            height: 30
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            anchors.left: parent.left
            anchors.right: parent.right

            anchors.leftMargin: 20
            anchors.rightMargin: 20

            text: "Сохранить"

            enabled: outputArea.text && true

            onClicked: fileExplorer.save(outputArea.text)
        }
    }

}


