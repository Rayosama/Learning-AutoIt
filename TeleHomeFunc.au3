   WinActivate("DreamScape")   ;Selects the client, so we're in the right area
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author: Kataya, Joseph

 Script Function:


#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
WinActivate("Dreamscape")
teleHome()
Exit

Func teleHome()
   MouseClick("left", 1648, 1059, 1, 3)
	  Sleep(250)
	  MouseClick("left", 1707, 804, 1, 3)
      Sleep(250)
EndFunc