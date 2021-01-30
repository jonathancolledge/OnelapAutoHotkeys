; The autohotkey script ends with a .ahk extension. In it you would have instructions such as those below
; Win+r shell:startup opens the startup folder. Add the autohotkey script here or create a script to start other scripts and put that in the startup folder


; the semicolon precedes a comment, it must have a space or tab in front of it, unless it is on its own line
; Anything before a double colon are the key presses, which, in the below case are ctrl J. As you can see the control key is represented by {^} and when I want to represent the caret, I have to enclose it in curly brackets. There are several other special keys just like this, so you need to check out the Autohotkeys documentation. You will also need to escape some characters with `
^j:: 
send, Jonathan ; this sends the word Jonathan once ctrl J is pressed
Return ; This ends the script for that keypress. You don't need return if it is a single line

; # is the windows key, + is the shift key, and ^ is control.

/*
The forward slash and star enable multi-line comments. They need to be on their own line
Do not use hotkeys that are the same as your OBS hotkeys because any application that detects keys at a low level, like Autohotkeys, OBS, and VCS, can not be overiden and will still respond.
You can disable hotkeys from the task bar notifications area.

This script enables the following commands on a 1920x1080 screen:

Win Shift o together - launches Onelap
Control o - bring focus back to the Onelap window
Control shift o together - minimises OBS
s - skips an interval
st - skip interval if turn around icon is absent
i - increases interval power
d - decreases interval power
t - turn around
y - agree to a rpompt (y for yes)
n - cancel or disagree with a prompt (n for No)
m - bring up the menu
p - click the power tab in the menu to see your stats (will only work if you have pressed m beforehand
Control and p together - will go straight to the power stats and then close after 10 seconds
e - ends the ride, but only if you have pressed m for menu beforehand. You will need to accept the next dialogue box by pressing y (or n if you decide not to quit)
Control and e together - ends the ride by automatically clicking the menu, pausing, clicking end ride, pausing again, and then clicking yes on the dialogue box. There are no second chances - this will quit the ride
x - exits the menu box
Control and l - turn left
Control and r - turn right
Control and a - go straight Ahead. l,r, and a only work when a junction choice flashes up on the left.

*/

#+o:: ; win shift o
Run, C:\Onelap\Onelap\OnelapLauncher.exe ;  For Windows store apps this won't actually work as store apps need a URI.
Return

^o::
WinActivate , Onelap ; brings focus back to Onelap
Return

#IfWinActive, ahk_exe onelap.exe

^+o:: ; This minimises OSB I'd probably like this key combo to launch OBS instead
if WinExist("OBS")
{
WinMinimize, OBS
Return
}
; Here curly brackets enclose a code block. They may not have been needed as it is a single line and I could omit the return too.

/*
ImageSearch can be used to search for an image on the screen. You can then use click to click it. This would be useful in Onelap
ImageSearch targets would include skip interval, increase and decrease interval power, turn around, menu button, end ride, power stats (the last two could include hitting the menu button first) 
This would be for a 1920x1080 screen
PixelSearch would be better to detect white in icons with a very small search area defined.
But instead I will just assume that the icons are always in the same place as I use the same screen size.
*/

s::
; This is to skip an interval. I don't really know what the semicolon before the MouseClick is for. If anyone knows, please let me know.
;MouseClick, left, 1705, 54
;Click, Screen, 1705, 54
CoordMode, Mouse, Screen
x := 1705
y := 54
Click %x% %Y%
MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

^s::
; This is to skip an interval when the turn around button is absent. I don't really know what the semicolon before the MouseClick is for. If anyone knows, please let me know.
;MouseClick, left, 1766, 54
;Click, Screen, 1766, 54
CoordMode, Mouse, Screen
x := 1766
y := 54
Click %x% %Y%
MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

; To increase interval power
i::
;MouseClick, left, 366, 205
;Click, Screen, 366, 205
CoordMode, Mouse, Screen
x := 366
y := 205
Click %x% %Y%
MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

; To decrease interval power
d::
;MouseClick, left, 201, 205
;Click, Screen, 201, 205
CoordMode, Mouse, Screen
x := 201
y := 205
Click %x% %Y%
MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

; To turn around
; This is the same location as skip interval sometimes
t::
;MouseClick, left, 1766, 54
;Click, Screen, 1766, 54
CoordMode, Mouse, Screen
x := 1766
y := 54
Click %x% %Y%
MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

; To click yes to a dialogue box
y::
;MouseClick, left, 790, 646
;Click, Screen, 790, 646
CoordMode, Mouse, Screen
x := 790
y := 646
Click %x% %Y%
MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

; To click no to a dialogue box
n::
;MouseClick, left, 1110, 646
;Click, Screen, 1110, 646
CoordMode, Mouse, Screen
x := 1110
y := 646
Click %x% %Y%
MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

; To click the menu box
m::
;MouseClick, left, 1874, 52
;Click, Screen, 1874, 52
CoordMode, Mouse, Screen
x := 1874
y := 52
Click %x% %Y%
; MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

; To click the power tab in the menu box
p::
;MouseClick, left, 315, 315
;Click, Screen, 315, 315
CoordMode, Mouse, Screen
x := 315
y := 315
Click %x% %Y%
; MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

; To see your power averages e.g. when you are targetting best 20 minute power, it is nice to see the average power every now and then. This'll show it to you, then close after 10 seconds.
^p:: ; shift p
;MouseClick, left, 1874, 52
;Click, Screen, 1874, 52
CoordMode, Mouse, Screen
x := 1874
y := 52
Click %x% %Y%
sleep, 500
;MouseClick, left, 315, 315
;Click, Screen, 315, 315
CoordMode, Mouse, Screen
x := 315
y := 315
Click %x% %Y%
sleep 10000
;MouseClick, left, 1745, 188
;Click, Screen, 1745, 188
CoordMode, Mouse, Screen
x := 1745
y := 188
Click %x% %Y%
MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

; To end ride from the menu box
e::
;MouseClick, left, 270, 831
;Click, Screen, 270, 831
CoordMode, Mouse, Screen
x := 270
y := 831
Click %x% %Y%
; MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

; To exit the menu box
x::
;MouseClick, left, 1745, 188
;Click, Screen, 1745, 188
CoordMode, Mouse, Screen
x := 1745
y := 188
Click %x% %Y%
MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

; To end ride all the way from game
^e:: ; this is control and e (that's what the ^e stands for) and that will execute the clicks below, with a 1 second (1000 ms) pause between each click. There is no confirmation to quit - it does it all.
;MouseClick, left, 1874, 52
;Click, Screen, 1874, 52
CoordMode, Mouse, Screen
x := 1874
y := 52
Click %x% %Y%
sleep, 1000
;MouseClick, left, 270, 831
;Click, Screen, 270, 831
CoordMode, Mouse, Screen
x := 270
y := 831
Click %x% %Y%
sleep, 1000
;MouseClick, left, 790, 646
;Click, Screen, 790, 646
CoordMode, Mouse, Screen
x := 790
y := 646
Click %x% %Y%
Return

; To turn left
^l::
;MouseClick, left, 80, 680
;Click, Screen, 80, 680
CoordMode, Mouse, Screen
x := 80
y := 680
Click %x% %Y%
MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

; To turn right
^r::
;MouseClick, left, 346, 680
;Click, Screen, 346, 680
CoordMode, Mouse, Screen
x := 346
y := 680
Click %x% %Y%
MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

; To go straight Ahead
^a::
;MouseClick, left, 213, 680
;Click, Screen, 213, 680
CoordMode, Mouse, Screen
x := 213
y := 680
Click %x% %Y%
MouseMove, 1920, 0 ; This will move the mouse to the top right of the screen and therefore out of view
Return

h::
MouseMove, 1920, 0 ; h for Hide mouse. This will move the mouse to the top right of the screen and therefore out of view
Return

/*
I have commented out this part.
^f23c:: ; this will hopefully close another script
fullScriptPath = E:\myscript.ahk ; edit with the full path to the script
DetectHiddenWindows, On 
WinClose, %fullScriptPath% ahk_class AutoHotkey
Return
*/

; So as not to use Luamacros, or to limit how many keys I have to define, I could have script dedicated to starting each ride program, closing other scripts and opening the script I want. I think I'd prefer to get lua macros working though