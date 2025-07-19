#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#SingleInstance Force

GroupAdd, Minecraft, Minecraft
GroupAdd, Minecraft, ahk_exe javaw.exe

; [MOVEMENT] - Select style by giving it a number
/*
1 = Thumb1 WASD Thumb1
2 = Index WASD
3 = Middle WASD
4 = Split1 WS on Middle north/south, A on Ring north, D on Index north
*/
chosenStyle := 4

; Movementstyle: Thumb
#If chosenStyle = 1 && WinActive("ahk_group Minecraft")
v::w
c::s
m::a
k::d
BS::Space

; Movementstyle: Index
#If chosenStyle = 2 && WinActive("ahk_group Minecraft")
BS::w
e::s
Space::a
r::d
m::Space
v::Ctrl

; Movementstyle: Index
#If chosenStyle = 3 && WinActive("ahk_group Minecraft")
Del::w
o::s
.::a
i::d
m::Space
v::Ctrl

; Movementstyle: Split1
#If chosenStyle = 4 && WinActive("ahk_group Minecraft")
Del::w
o::s
Ctrl::a
BS::d
m::Space
v::Ctrl

; [INTERACT]
/*
o::r		; left Middle south		open tool menu / see recipe
i::u 		; left Middle east		see uses
,::x		; left Ring west		load Hotbar Activator
'::c		; left Ring east		save Hotbar Activator
*/

; [INVENTORY]
/*
g::e		; left Thumb2 west		open inventory
w::b		; left Thumb2 east		open backpack
z::g		; left Thumb2 south		open curios inventory
e::f		; left Index south		swap held/offhand
*/

; [toggle, CHAT, etc.]
#IfWinActive ahk_group Minecraft
~Enter::	; left Thumb3 south		toggle, chat
	Suspend, Permit
	Suspend
	return
~ESC::
	Suspend, Permit
	Suspend, Off
	return