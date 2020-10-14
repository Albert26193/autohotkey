#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;--------------------------
;quit programme
;--------------------------
<+q::
Send,!{f4}
Return


;----------------------------
;replace arrow keys
;---------------------------
<!j::
   Send, {Down}
Return

<!l::
   Send, {Right}
Return

<!h::
   Send, {Left}
Return

<!k::
   Send, {Up}
Return


;-------------------------------
;hide icons
;------------------------------
<!0::
HideOrShowDesktopIcons()
return
 
HideOrShowDesktopIcons()
{
	ControlGet, class, Hwnd,, SysListView321, ahk_class Progman
	If class =
		ControlGet, class, Hwnd,, SysListView321, ahk_class WorkerW
 
	If DllCall("IsWindowVisible", UInt,class)
		WinHide, ahk_id %class%
	Else
		WinShow, ahk_id %class%
}


;-----------------------------
;left and right buttom
;-----------------------------
<+c::
	Send,{Click}
	;Send, {LButton}
return

<+v::
	Send,{Click right}
	;Send, {RButton}
return


;--------------------------
;update 2020.9.18
;--------------------------


;-------------------------------------------------------------
;double click right-button to maxsize or return to common
;--------------------------------------------------------------
WinStatus:=0
RButton::
	KeyWait, RButton    		;release right-button to continue
	keyWait, RButton, D T0.15  ;second click within 100ms
If ErrorLevel           
	Click, Right       
	Else        
	{             
		if WinStatus=0    
		{         
			WinMaximize,A         
			WinStatus:=1    
		}    
		else    
		{         
			WinRestore,A         
			WinStatus:=0    
		}        
	}    
Return  


;------------------------------------
;left_alt+e to maxmize or restore
;left_alt+d to minimize
;------------------------------------ 
<!e::    
	if WinStatus=0    
	{  
	 	WinMaximize,A
	    WinStatus:=1    
	 }    
	 else    
	 {
	 	WinRestore,A
	    WinStatus:=0    
	 }    
return

<!d::
	WinMinimize,A
return


;--------------------------
;choose txt just like mac
;--------------------------
!,::
	Send,^+{Left}
return

!.::
	Send,^+{Right}
return

;-------------------------
;jump to head of the line
;-------------------------
<!u::
	Send,{Home}
return

<!p::
	Send,{End}
return

;----------------------
;choose the whole line
;----------------------
<![::
	Send,{Home}
	Send,+{End}
return


;--------------------------
;delete
;--------------------------
<+r::
	Send,{Delete}
return

<!m::
	Send,{Delete}
return

<+f::
	Send,{BackSpace}
return

<!n::
	Send,{BackSpace}
return

;--------------------------------
;num_replace::==Capslock
;-------------------------------
>+CapsLock::
    Send,{+}
return


CapsLock::
    Send,{=}
return

;-----------------------------------------------
;rename the files with Rshift and Enter
;-----------------------------------------------
#IfWinActive ahk_exe Explorer.ExE
{
	Rshift::
		Send,{F2 Down}{F2 up}
	Return

	Enter::
		Send,{Blind}{Enter}
	Return
}
#IfWinActive
