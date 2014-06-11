#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.10.2
	Author:         Vort3chs

	Script Function:
	Flood a user on facebook with messages!

#ce ----------------------------------------------------------------------------

#include <FileConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <SliderConstants.au3>
#include <ProgressConstants.au3>


Global $folderpath, $nvar, $cuicountdown, $rndvarprog, $radio4, $radio3, $progress1, $slidecheckbox, $readslide, $slider1, $button2, $label14, $rndnumbinput, $min, $max, $rndnumb, $message, $ms, $msgs, $spamnumb, $input1, $input2, $input3, $button1, $input4, $label1, $label2, $label3, $radio1, $radio2, $msgstosend, $spammeduser, $label5, $label6, $label7, $label8, $suicidalscript, $label10, $label11, $label12, $label13, $label14, $label15, $label16

spmgui()
deflogdir()

Func spmgui()
	ConsoleWrite('@@ (27) :(' & @MIN & ':' & @SEC & ') spmgui()' & @CR) ;### Function Trace
	$form1_1_1 = GUICreate("FaceBook Spam-Bot v3.03", 675, 619, 261, 222)
	$input1 = GUICtrlCreateInput("", 408, 112, 169, 21)
	$input2 = GUICtrlCreateInput("", 408, 144, 169, 21)
	$input3 = GUICtrlCreateInput("60", 408, 176, 169, 21)
	$button1 = GUICtrlCreateButton("Launch Spam-Bot (With Current Settings)", 240, 360, 209, 49)
	$input4 = GUICtrlCreateInput("69", 408, 208, 169, 21)
	$label1 = GUICtrlCreateLabel("Spam Message:", 320, 112, 80, 17)
	$label2 = GUICtrlCreateLabel("Log File Directory:", 312, 144, 89, 17)
	$label3 = GUICtrlCreateLabel("Time between each:", 296, 176, 109, 17)
	$radio1 = GUICtrlCreateRadio("Custom Text Spam-Bot", 40, 112, 177, 17)
	GUICtrlSetState(-1, $gui_checked)
	GUICtrlSetCursor(-1, 0)
	$radio2 = GUICtrlCreateRadio("Random Number Spam-Bot", 40, 152, 177, 17)
	GUICtrlSetCursor(-1, 0)
	$msgstosend = GUICtrlCreateLabel("Number of messages to send:", 256, 208, 144, 17)
	$spammeduser = GUICtrlCreateInput("", 408, 240, 169, 21)
	$label5 = GUICtrlCreateLabel("User Being Spamed:", 296, 240, 101, 17)
	$label6 = GUICtrlCreateLabel("READ THIS:", 56, 216, 69, 17)
	$label7 = GUICtrlCreateLabel(">More than 1,000 messages is not allowed,", 8, 232, 239, 17)
	$label8 = GUICtrlCreateLabel(">If the time between messages is less than 60ms", 8, 272, 239, 17)
	$suicidalscript = GUICtrlCreateLabel("the script will not continue and commit suicide.", 8, 288, 226, 17)
	$label10 = GUICtrlCreateLabel(">After you hit 'Launch' you have 20 seconds to select the text input box", 8, 312, 341, 17)
	$label11 = GUICtrlCreateLabel("for messages on FaceBook. If anything else is selected, disaster results.", 8, 328, 341, 17)
	GUICtrlCreateInput("", 408, 112, 169, 21)
	$label14 = GUICtrlCreateLabel("ms", 584, 184, 17, 17)
	$label15 = GUICtrlCreateLabel("messages", 584, 217, 51, 17)
	$label16 = GUICtrlCreateLabel("Created by: Austen Lage", 0, 0, 121, 17)
	$label4 = GUICtrlCreateLabel("!!! IF AT ANYTIME THE SCRIPT NEEDS TO BE HALTED PRESS THE UP ARROW !!!", 112, 56, 426, 17)
	$button2 = GUICtrlCreateButton("About", 568, 0, 97, 33)
	$label9 = GUICtrlCreateLabel("sorry, it causes issues currently.", 8, 248, 152, 17)
	$label12 = GUICtrlCreateLabel("Change the speed with this slider!", 264, 440, 169, 17)
	$slider1 = GUICtrlCreateSlider(16, 504, 633, 41)
	GUICtrlSetLimit(-1, 1000, 60)
	GUICtrlSetData(-1, 60)
	$label13 = GUICtrlCreateLabel("\/", 24, 488, 14, 17)
	$label17 = GUICtrlCreateLabel("Slowest (1 second)", 0, 472, 102, 17)
	$label18 = GUICtrlCreateLabel("\/", 632, 488, 14, 17)
	$label19 = GUICtrlCreateLabel("Fastest! (60ms)", 592, 472, 75, 17)
	$progress1 = GUICtrlCreateProgress(144, 8, 353, 25)
	GUISetState(@SW_SHOW)
EndFunc   ;==>spmgui

While 1
	$msg = GUIGetMsg()
	If $msg = $gui_event_close Then ExitLoop
	If $msg = $button1 Then button1()
	If $msg = $button2 Then about()
	If $msg = $radio2 And GUICtrlRead($radio2) = $gui_checked Then
		GUICtrlSetData($input1, "ONLY FOR CUSTOM BOT!")
	EndIf
	If $msg = $radio1 And GUICtrlRead($radio1) = $gui_checked Then
		GUICtrlSetData($input1, "")
	EndIf
	If $msg = GUICtrlRead($radio4) = $gui_checked Then
		$readslide = 1000 - GUICtrlRead($slider1) + 60
		GUICtrlSetData($input3, $readslide)
	EndIf
	slideget()
WEnd

Func button1()
	ConsoleWrite('@@ (89) :(' & @MIN & ':' & @SEC & ') button1()' & @CR) ;### Function Trace
	If GUICtrlRead($radio1) = $gui_checked Then
		HotKeySet("{UP}", "EmergencyStop")
		custspam()
	Else
		HotKeySet("{UP}", "EmergencyStop")
		rndspam()
	EndIf
EndFunc   ;==>button1

Func deflogdir()
	ConsoleWrite('@@ (100) :(' & @MIN & ':' & @SEC & ') deflogdir()' & @CR) ;### Function Trace
	$folderpath = @UserProfileDir & "\Desktop\log.txt"
	GUICtrlSetData($input2, $folderpath)
EndFunc   ;==>deflogdir

Func slideget()
	ConsoleWrite('@@ (106) :(' & @MIN & ':' & @SEC & ') slideget()' & @CR) ;### Function Trace
	$readslide = 1000 - GUICtrlRead($slider1) + 60
	GUICtrlSetData($input3, $readslide)
EndFunc   ;==>slideget

Func about()
	ConsoleWrite('@@ (112) :(' & @MIN & ':' & @SEC & ') about()' & @CR) ;### Function Trace
	MsgBox($mb_iconinformation, "About the Developer:", "Created by: Austen Lage (Vort3chs)" & @CRLF & @CRLF & "This version was released on 2-28-2014" & @CRLF & @CRLF & "All of the code, the README, updated download links, my other programs, etc. are available here: http://github.com/Vort3chs" & @CRLF & @CRLF & "Thanks for using my program! :)")
EndFunc   ;==>about

Func emergencystop()
	ConsoleWrite('@@ (117) :(' & @MIN & ':' & @SEC & ') emergencystop()' & @CR) ;### Function Trace
	Opt("SendKeyDelay", 0)
	Opt("SendKeyDownDelay", 0)
	Sleep(50)
	Send("{!}{!}{!} The execution of the bot has been canceled by the user {!}{!}{!}")
	Send("{ENTER}")
	Sleep(30)
	Run("FaceBookSpamBotv3.03.exe", "", "")
	Exit
EndFunc   ;==>emergencystop

Func custspam()
	ConsoleWrite('@@ (129) :(' & @MIN & ':' & @SEC & ') custspam()' & @CR) ;### Function Trace
	GUICtrlSetData($progress1, 10)
	$rndvarprog = False
	$spmdusr = GUICtrlRead($spammeduser)
	$message = GUICtrlRead($input1)
	$ms = GUICtrlRead($input3)
	$msgs = GUICtrlRead($input4)
	Opt("SendKeyDelay", 0)
	Opt("SendKeyDownDelay", 0)
	Opt("TrayAutoPause", 1)
	Sleep(20000)
	Send("Preparing FaceBook Spam-Bot v3.03.....")
	Send("{ENTER}")
	Sleep(100)
	Send("Hello, " & $spmdusr & ", after exactly 30 seconds you you will receive " & $msgs & " messages, each separated from the other by " & $ms & "ms.")
	Send("{ENTER}")
	Sleep(15000)
	GUICtrlSetData($progress1, 20)
	Send("15 seconds remaining...")
	Send("{ENTER}")
	Sleep(10000)
	Send("5{!}")
	Send("{ENTER}")
	Sleep(1000)
	Send("4{!}")
	Send("{ENTER}")
	Sleep(1000)
	Send("3{!}")
	Send("{ENTER}")
	Sleep(1000)
	Send("2{!}")
	Send("{ENTER}")
	Sleep(1000)
	Send("1{!}")
	GUICtrlSetData($progress1, 35)
	Send("{ENTER}")
	Sleep(150)
	Send("Begin{!}")
	Send("{ENTER}")
	For $spamnumb = 1 To $msgs
		GUICtrlSetData($progress1, 50)
		Send($message & "{ENTER}")
		Sleep($ms)
	Next
	GUICtrlSetData($progress1, 60)
	Send("Your name is " & $spmdusr & ".")
	Send("{ENTER}")
	Sleep(1000)
	spamlog()
	GUICtrlSetData($progress1, 75)
	Send("I, the script, have logged you as a test subject. Thank you for your involuntary participation{!}")
	Send("{ENTER}")
	Sleep(300)
	Send("Spamming complete.")
	Send("{ENTER}")
	Sleep(1000)
	GUICtrlSetData($progress1, 80)
	Send("Want to keep up on the development of this project? Check out my GitHub... https://github.com/Vort3chs/ - Austen Lage")
	Send("{ENTER}")
	Sleep(1000)
	MsgBox($mb_iconinformation, "FaceBook Spam-Bot v3.0", "Spamming complete!")
	MsgBox($mb_iconinformation, "FaceBook Spam-Bot v3.0", "Created by: Vort3chs, and UnbornDevour")
	GUICtrlSetData($progress1, 100)
	$rndvarprog = True
	GUISetState(@SW_SHOW)
	Sleep(2000)
	GUICtrlSetData($progress1, 0)
EndFunc   ;==>custspam

Func rndspam()
	ConsoleWrite('@@ (199) :(' & @MIN & ':' & @SEC & ') rndspam()' & @CR) ;### Function Trace
	GUICtrlSetData($progress1, 10)
	$spmdusr = GUICtrlRead($spammeduser)
	$ms = GUICtrlRead($input3)
	$msgs = GUICtrlRead($input4)
	Opt("SendKeyDelay", 0)
	Opt("SendKeyDownDelay", 0)
	Opt("TrayAutoPause", 1)
	Sleep(20000)
	Send("Preparing FaceBook Spam-Bot v3.03.....")
	Send("{ENTER}")
	Sleep(100)
	Send("Hello, " & $spmdusr & ", after exactly 30 seconds you you will receive " & $msgs & " strings of random numbers, each separated from the other by " & $ms & "ms.")
	Send("{ENTER}")
	Sleep(15000)
	GUICtrlSetData($progress1, 20)
	Send("15 seconds remaining...")
	Send("{ENTER}")
	Sleep(10000)
	Send("5{!}")
	Send("{ENTER}")
	Sleep(1000)
	Send("4{!}")
	Send("{ENTER}")
	Sleep(1000)
	Send("3{!}")
	Send("{ENTER}")
	Sleep(1000)
	Send("2{!}")
	Send("{ENTER}")
	Sleep(1000)
	Send("1{!}")
	GUICtrlSetData($progress1, 35)
	Send("{ENTER}")
	Sleep(150)
	Send("Begin{!}")
	Send("{ENTER}")
	Sleep(10)
	GUICtrlSetState($progress1, $spamnumb)
	For $spamnumb = 1 To $msgs
		$min = 100000000000000
		$max = 999999999999999
		$rndnumb = Random($min, $max, 0)
		Send($rndnumb & "{ENTER}")
		GUICtrlSetData($progress1, 50)
		GUICtrlSetData($progress1, $rndnumb)
		Sleep($ms)
	Next
	GUICtrlSetData($progress1, 60)
	Send("Your name is " & $spmdusr & ".")
	Send("{ENTER}")
	Sleep(1000)
	rndspamlog()
	GUICtrlSetData($progress1, 75)
	Send("I, the script, have logged you as a test subject. Thank you for your involuntary participation{!}")
	Send("{ENTER}")
	Sleep(300)
	Send("Spamming complete.")
	Send("{ENTER}")
	Sleep(1000)
	GUICtrlSetData($progress1, 80)
	Send("Want to keep up on the development of this project? Check out my GitHub... https://github.com/Vort3chs/ - Austen Lage")
	Send("{ENTER}")
	Sleep(1000)
	MsgBox($mb_iconinformation, "FaceBook Spam-Bot v3.0", "Spamming complete!")
	MsgBox($mb_iconinformation, "FaceBook Spam-Bot v3.0", "Created by: Vort3chs, and UnbornDevour")
	GUICtrlSetData($progress1, 100)
	GUISetState(@SW_SHOW)
	Sleep(2000)
	GUICtrlSetData($progress1, 0)
EndFunc   ;==>rndspam

Func spamlog()
	ConsoleWrite('@@ (272) :(' & @MIN & ':' & @SEC & ') spamlog()' & @CR) ;### Function Trace
	$spmdusr = GUICtrlRead($spammeduser)
	$message = GUICtrlRead($input1)
	$ms = GUICtrlRead($input3)
	$msgs = GUICtrlRead($input4)
	$iinfo = GUICtrlRead($input2)
	Local Const $filepath = $iinfo
	Local $fileopen = FileOpen($filepath, $fo_append)
	FileWriteLine($fileopen, "You spammed " & $spmdusr & " with " & $msgs & " messages, " & "there were " & $ms & " milliseconds between each message. The message was:" & $message & @CRLF & @CRLF)
EndFunc   ;==>spamlog

Func rndspamlog()
	ConsoleWrite('@@ (284) :(' & @MIN & ':' & @SEC & ') rndspamlog()' & @CR) ;### Function Trace
	$spmdusr = GUICtrlRead($spammeduser)
	$ms = GUICtrlRead($input3)
	$msgs = GUICtrlRead($input4)
	$iinfo = GUICtrlRead($input2)
	Local Const $filepath = $iinfo
	Local $fileopen = FileOpen($filepath, $fo_append)
	FileWriteLine($fileopen, "You spammed " & $spmdusr & " with " & $msgs & " messages, " & "there were " & $ms & " milliseconds between each message. The messages sent were randomly generated strings of numbers, consisting of 15 characters each." & @CRLF & @CRLF)
EndFunc   ;==>rndspamlog
