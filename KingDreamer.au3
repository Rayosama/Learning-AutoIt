#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author: Kataya, Joseph

 Script Function:


#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

;Used for hunting mobs in DreamScape

#include <AutoItConstants.au3>

HotKeySet("{f1}","myExit")
HotKeySet("{f2}","SetHuntArea")
HotKeySet("{f3}","SetHuntColor")
HotKeySet("{f4}","AttackToggle")
HotKeySet("{f5}","GoToPengs")

global $attacking = False
Global $goHome = False
global $Hunting = False

global $huntingForColor = 0x5B9CB9 ;King Dreamer color
global $huntingForColor2 = 0x504848   ; Scorpion Thing
global $huntingForColor3 = 0x600B05 ; Spider
;hunting area
$x1 = 430
$y1 = 274
$x2 = 1533
$y2 = 846
while(1)


   WinActivate("DreamScape")   ;Selects the client, so we're in the right area


   ;find Kingdream and Attack
   $pix = PixelSearch($x1, $y1, $x2, $y2, $huntingForColor, 5) ; First two number sets are coords on the screen for our bounds.Then color code, and then shade difference
   if not(@error) Then ;This means we found it and Hunting is True

	  ;click and attack mob
	  MouseClick("left", $pix[0], $pix[1],1,2) ;Left click using the array at index x=0, y=5, click once, per 1 sec
	  sleep(6000)
	  $attacking = true;

   EndIf

   ;find Scorpion and attack
   $pix = PixelSearch($x1, $y1, $x2, $y2, $huntingForColor, 5) ; First two number sets are coords on the screen for our bounds.Then color code, and then shade difference
   if not(@error) Then ;This means we found it and Hunting is True

	  ;attack
	  MouseClick("left", $pix[0], $pix[1],1,2) ;Left click using the array at index x=0, y=5, click once, per 1 sec
	  sleep(6000)
	  $attacking = true;
   EndIf

   ;Looking for spider and attacking it
   $pix = PixelSearch($x1, $y1, $x2, $y2, $huntingForColor3, 5) ; First two number sets are coords on the screen for our bounds.Then color code, and then shade difference
   if not(@error) Then ;This means we found it and Hunting is True

	  ;click and attack mob
	  MouseClick("left", $pix[0], $pix[1],1,2) ;Left click using the array at index x=0, y=5, click once, per 1 sec
	  sleep(6000)
	  $attacking = true;
   EndIf




WEnd




func myExit()
   MsgBox(0, "Ending","Bot has exited")
   Exit
EndFunc

Func TeleHome()
   MouseClick("left", 1648, 1059, 1, 2)
	  Sleep(250)
	  MouseClick("left", 1707, 804, 1, 2)
      Sleep(250)
EndFunc


Func GoToPengs()

   MouseClick("left", 1648, 1059, 1, 1) ;teleports tab
	  Sleep(2000)

   MouseClick("left", 1756, 872, 1, 1) ;selects monsters tab
	  Sleep(2500)

   MouseClick("left", 622, 418, 1, 1) ;clicks penguins from the options
	  Sleep(2000)

   MouseClick("left", 786, 529, 1, 1) ;clicks to teleport to penguins
	  Sleep(6500)


   MouseClick("left", 933, 547, 2, 1) ;clicks yellow portal to level 2
	  Sleep(3500)

   MouseClick("left", 258, 972, 1, 1) ;confirms teleport to next level
	  Sleep(6500)

    MouseClick("left", 933, 547, 2, 1) ;clicks yellow portal to level 3
	  Sleep(4500)

   MouseClick("left", 258, 972, 1, 1) ;confirms teleport to next level
	  Sleep(3500)

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

func SetHuntColor()
   MsgBox(0, "Set Hunting Color", "Place your mouse over the color you would like to hunt for. (Be Careful! Colors too similar can interfere")
   $huntingForColor = MouseGetPos() ;This grabs the information from where the mouse clicks and stores it into this variable
   $huntingForColor = PixelGetColor($huntingForColor[0],$huntingForColor[1]) ;we call the func pixelgetcolor to retrieve the color value, and we plug in the x/y coords from the $huntingForColor variable
EndFunc

Func AttackToggle()
   if $Hunting == true Then
	  $Hunting = False
   Else
	  $Hunting = True
   EndIf
EndFunc











