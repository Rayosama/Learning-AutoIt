#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

WinActivate("*Untitled")

Local $i = 0
While($i <= 5)

   $random = Random(2000, 5000, 1)

   Send($random)
  $i = $i +1
WEnd

Exit
