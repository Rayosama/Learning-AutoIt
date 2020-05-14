#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
WinActivate("Dreamscape")

; Script Start - Add your code below here
#include "Constants.au3"
#include "GUIConstantsEx.au3"
#include "ImageSearch2015.au3"

Func findImage($imageFile)
    ;search entire screen area for image, return img coords if found, false if not
    Local $searchAreaX1 = 0
    Local $searchAreaY1 = 0
    Local $searchAreaX2 = @DesktopWidth
    Local $searchAreaY2 = @DesktopHeight
    Local $transparentColor = 0xEA00F6 ;bright magenta color
    Local $imgX = 0
    Local $imgY = 0

    Local $result = _ImageSearchArea($imageFile, 1, $searchAreaX1, $searchAreaY1, $searchAreaX2, $searchAreaY2, $imgX, $imgY, 0, $transparentColor)

    If $result = 1 Then
        Local $imgCoords[2] = [$imgX, $imgY]
        Return $imgCoords
    Else
        Return false
    EndIf
EndFunc

GUICreate("ImageSearch demo", 200, 100)
GUICtrlCreateLabel("ImageSearch demo" & @CRLF & @CRLF & "- F9 test"& @CRLF & "- ESC exit", 10, 10, 100)
GUISetState()

HotkeySet ("{F9}", test)
HotkeySet ("{ESC}", exitScript)

Func test()
   WinActivate("DreamScape")
     Local $result = findImage("test.jpg")

    If $result = false Then
        MsgBox(0, 'Error', "Image was not found on screen.")
    Else
        MouseMove($result[0], $result[1], 10)
        MouseClick($MOUSE_CLICK_RIGHT)
    EndIf
EndFunc

Func exitScript()
    Exit
EndFunc


Func idle()
    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                exit
        EndSwitch
        sleep(40)
    WEnd
EndFunc

idle()