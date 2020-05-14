#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author: Kataya, Joseph

 Script Function:


#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

global $huntingForColor = 0xD121CE ;0x3F211D

HotKeySet("{f1}","myExit")
HotKeySet("{f2}","SetHuntArea")

$x1 = 1667
$y1 = 784
$x2 = 1850
$y2 = 1039

while(1)


   WinActivate("DreamScape")   ;Selects the client, so we're in the right area


   ;find a package
   $pix = PixelSearch($x1, $y1, $x2, $y2, $huntingForColor, 3) ; First two number sets are coords on the screen for our bounds.Then color code, and then shade difference
   if not(@error) Then ;This means we found it and starts clicking
   MouseClick("Left", $pix[0], $pix[1], 4, 1)
   EndIf


WEnd

func myExit()
   MsgBox(0, "Ending","Bot has exited")
   Exit
EndFunc

Func SetHuntArea()
   MsgBox(0, "Setting Hunting Area", "Place your mouse to the Top Left cornor, and hover where you want and press space to continue")
   $mouse = MouseGetPos()  ;This grabs the information from where the mouse clicks and stores it into this variable
   $x1 = $mouse[0] ;the values are stored in an array, so the X value is at index 0
   $y1 = $mouse[1] ;the values are stored in an array, so the Y value is at index 1

   MsgBox(0, "Setting Hunting Area", "Place your mouse to the Bottom Right cornor, and hover where you want and press space to continue")
   $mouse = MouseGetPos()  ;This grabs the information from where the mouse clicks and stores it into this variable
   $x2 = $mouse[0] ;the values are stored in an array, so the X value is at index 0
   $y2 = $mouse[1] ;the values are stored in an array, so the Y value is at index 1
EndFunc
