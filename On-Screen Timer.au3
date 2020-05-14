#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author: Kataya, Joseph

 Script Function:


#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

$setLabel = ""

Opt("GUICloseOnESC", 0) ; prevent user from pressing escape key and accidentally cancelling the GUI

#Region ### START Koda GUI section ###
Global $Deploy_Dialogue = GUICreate("Oh bother", 601, 349, -1, -1, 0, $WS_EX_TOPMOST)
GUISetFont(8, 400, 0, "MS Reference Sans Serif")
Global $Header = GUICtrlCreateLabel("Universal Destructor", 0, 24, 597, 26, $SS_CENTER)
GUICtrlSetFont(-1, 10, 400, 0, "MS Reference Sans Serif")
Global $Warning = GUICtrlCreateLabel("", 0, 80, 599, 36, $SS_CENTER)
GUICtrlSetFont(-1, 12, 800, 0, "MS Reference Sans Serif")
Global $Static_text = GUICtrlCreateLabel("Intializing ....." & @CRLF & @CRLF & "Grab yer knickers, implosion starts soon!.", 40, 136, 516, 114)
GUICtrlSetFont(-1, 10, 400, 0, "MS Reference Sans Serif")
Global $OK_BTN = GUICtrlCreateButton("OK", 360, 272, 75, 25)
GUICtrlSetState(-1, $GUI_HIDE)
Global $CANCEL_BUTTON = GUICtrlCreateButton("Cancel", 456, 272, 75, 25, $BS_DEFPUSHBUTTON)
GUICtrlSetState(-1, $GUI_HIDE)
Global $Counter = GUICtrlCreateInput("", 32, 272, 25, 24, BitOR($ES_CENTER, $ES_READONLY))
GUICtrlSetState(-1, $GUI_HIDE)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

GUICtrlSetData($Warning, "!!!!!!!!!!!!!!!  A C H T U N G  !!!!!!!!!!!!!!!!")
GUICtrlSetState($Counter, $GUI_SHOW)

GUICtrlSetState($OK_BTN, $GUI_SHOW)
GUICtrlSetState($CANCEL_BUTTON, $GUI_SHOW)
GUICtrlSetState($CANCEL_BUTTON, $GUI_FOCUS)


$Timer = TimerInit() ; initialize timer
$wait = 1000 * 15 ; 15 second wait for the user to stop the implosion

While TimerDiff($Timer) < $wait
    $nMsg = GUIGetMsg()
    $seconds = TimerDiff($Timer) / 1000
    $diff = $seconds - ($wait / 1000)
    $minutes = Int($diff / 60)
    $secondsRem = $diff - ($minutes * 60)
    $secondsRem = $secondsRem * -1
    $time = StringFormat("%02d", $secondsRem)
    If $time < 5 And $setLabel = "" Then
        $setLabel = 1
        GUICtrlSetData($Warning, "!!!!!!!!!!!!!!!  O h , d e a r  !!!!!!!!!!!!!!!!")
        GUICtrlSetData($Static_text, "In 5 seconds the timer will end and the universe will implode." & @CRLF & @CRLF & "To exit you can still click Cancel..")
    EndIf
    GUICtrlSetData($Counter, $time)
    Switch $nMsg
        Case $GUI_EVENT_CLOSE ; the GUI crashed (should never happen) or more likeley you allowed the user to use ESC to close the GUI
            ; do something here if the GUI crashed; probably just follow the dolphins
        Case $CANCEL_BUTTON ; do something here, the user canceled
            GUISetState(@SW_HIDE, $Deploy_Dialogue) ; hide the GUI
            MsgBox(48, "Oopsies!", "You cannot stop entropy.")
            Exit
        Case $OK_BTN ; do something here, the user clicked OK
            GUISetState(@SW_HIDE, $Deploy_Dialogue) ; hide the GUI
            MsgBox(4096, "Hooray!", "Entropy is accelerated!")
            Exit

    EndSwitch
WEnd

; after 15 seconds the GUI will close and your stuff starts
GUISetState(@SW_HIDE, $Deploy_Dialogue) ; hide the GUI
MsgBox(4096, "Whee!", "Entropy wins the day!", 15)
exit