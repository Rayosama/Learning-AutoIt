#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author: Kataya, Joseph

 Script Function:


#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

WinActivate("Untitled")
Send("Hello World")
sleep(5000) ;This is a delay in milisceonds, this is equal to 5 seconds
send("{enter}") ;To send commands like enter, shift, arrow key, etc. Put inside
send("This is a test")
send("!{f4}")

