import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.3

import ssa.io 1.0

Rectangle {
    id: root

    property string fileContent: fileWorker.text
    property string __saveData: ""
    property bool isInput: true

    height: 70

    color: "#404244"

    FileWorker {
        id: fileWorker
    }

    Rectangle {
        id: inputBackground

        height: 30

        color: "#DADAD9"

        anchors.left: parent.left
        anchors.leftMargin: 10

        anchors.top: parent.top
        anchors.topMargin: 20

        anchors.right: chooseFile.left
        anchors.rightMargin: 10

        TextField {
            id: fileInput

            placeholderText: "Выберите файл..."

            anchors.fill: parent

            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
            }

            verticalAlignment: "AlignVCenter"
            font.pixelSize: 16

        }

    }

    Button {
        id: chooseFile

        width: 100
        height: 30

        text: "Обзор..."

        anchors.right: parent.right
        anchors.top: parent.top

        anchors.topMargin: 20
        anchors.rightMargin: 10

        font.pixelSize: 16

        onClicked: fileDialog.visible = true
    }

    FileDialog {
        id: fileDialog
        title: "Выберите файл..."
        folder: shortcuts.home
        onAccepted: {
            if(isInput) {
                fileInput.text = fileUrls[0] !== undefined ? fileUrls[0] : ""
                fileWorker.url = fileUrls[0] !== undefined ? fileUrls[0] : ""
            } else {
                fileWorker.save(__saveData, fileUrls[0])
                isInput = true
            }
        }
    }

    function save(text) {
        isInput = false
        __saveData = text
        fileDialog.visible = true
    }
}
