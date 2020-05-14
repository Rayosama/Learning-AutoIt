#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

;Used for hunting mobs in DreamScape

HotKeySet("{f1}","myExit")
HotKeySet("{f2}","SetHuntArea")
HotKeySet("{f3}","SetHuntColor")
HotKeySet("{f4}","AttackToggle")
HotKeySet("{f5}","GoToPengs")

global $attacking = False
Global $goHome = False
global $Hunting = True

global $huntingForColor = 0x057508 ;0x057508 Or  Or 0x057508
Global $count = 0
Global $amountleft = 0
$min = @MIN
$begin = TimerInit()

;hunting area
$x1 = 430
$y1 = 274
$x2 = 1533
$y2 = 846
while(1)
   $random = Random(3500, 3500, 1)
   $random1 = Random(3300, 3700, 1)
   $random2 = Random(2300, 2600, 1)
   $random3 = Random(800, 1200, 1)

   ;Selects the client, so we're in the right area
   WinActivate("DreamScape")
   Sleep(1000)
   ;Checks if inv is full, then calls Bank method
   $pix = PixelSearch(1802, 1018,1802, 1018, 0x443C32, 2) ; First two number sets are coords on the screen for our bounds.Then color code, and then shade difference
   if @error Then
	  BankItems()
	  Sleep($random3)
	  Inventory()
   EndIf



   ; This checks for when the enemies health goes to zero, it will wait 5 sec and then teleport back
;	$pix2 = PixelSearch(970, 323, 970, 323, 0xFCFCFC, 1)
   $pix2 = PixelSearch(130, 243, 130, 243, 0x52410D, 5)
   if Not(@error) Then
	  VoldemortTele()
	  Inventory()
	  $Hunting = True

   EndIf

   ;If we miss a kill, a window pops up, and blocks our FOV. This willl closs that
   $pix3 = PixelSearch(844, 505, 845, 506, 0xA69363, 1)
   if Not(@error) Then
	  MouseClick("Left", 974, 411, 1, 1)
	  Sleep(1000)
   EndIf


   ;find a mob
   $pix = PixelSearch($x1, $y1, $x2, $y2, $huntingForColor, 3) ; First two number sets are coords on the screen for our bounds.Then color code, and then shade difference
   if (not(@error) And $Hunting) Then ;This means we found it and Hunting is True

	  ;click and attack mob
	  MouseClick("left", $pix[0], $pix[1],1,1) ;Left click using the array at index x=0, y=5, click once, per 1 sec
	  If Not(@error) Then
		 $attacking = True;
	  EndIf


	  while($attacking) ;while the variable attacking is true, this while loop will run
	  ;are we still attacking the mod?
	  	  $isAttacking = PixelSearch(10, 79, 10, 79, 0x105B10, 1) ;The 1 for color variable at the end means it's looking for an exact match
		  if not(@error) Then ;As long the above is true, it will execute the commands below
			 $Hunting = False
		  Else
			 $attacking = False
		  EndIf ;This is how you end an if loop



	  WEnd ;This is how you end a while loop

	  ;are we healthy enough to continue attacking?

	 ; $goHome = True
	  ;$hpBar = PixelSearch( 1655, 97, 1657, 99, 0x890302, 1)
	  ;if @error Then ;this means we didn't find it
	;	 teleHome()
	 ; EndIf

  ; Else
	;  $goHome = False
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

Func VoldemortTele()

   Sleep($random)
   MouseClick("left", 1654, 1061, 2, 1) ;teleports tab
   Sleep(2000)

   MouseClick("left", 1756, 973, 2, 1) ;selects raidss tab
	  Sleep($random1)

   MouseClick("left", 781, 525, 2, 1) ;clicks voldemort from the options
	  Sleep($random2)

   MouseClick("left", 1777, 760, 2, 1) ;clicks inventory from the options
	  Sleep($random2)

EndFunc

Func BankItems()
   Send("::bank") ;types the ::bank command
   Send("{Enter}") ;hits enter
   Sleep(2000) ;sleeps for 2 sec

   MouseClick("left", 979, 620, 2, 1) ;Clicks the bank deposit button
	  Sleep(1500)

   Send("{escape}")


EndFunc

Func Inventory()
   MouseClick("left", 1778, 765, 2, 1)
EndFunc












